import 'dart:async';
import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hyperce_booking/core/utils/utils.dart';
import '../../features/common/data/model/app_response_model.dart';
import '../utils/logarte_util.dart';
import '../utils/storage_util.dart';
import '../values/const_keys.dart';
import 'http_config.dart';

class SGraphQLApi {
  late GraphQLClient _client;
  String _token = "";

  Completer<bool>? _refreshCompleter;
  bool _isRefreshingToken = false;

  final StreamController<bool> _logoutController =
      StreamController<bool>.broadcast();

  Stream<bool> get logoutStream => _logoutController.stream;

  SGraphQLApi._internal() {
    _client = _createClient();
  }

  static final _singleton = SGraphQLApi._internal();
  factory SGraphQLApi() => _singleton;

  // ===================== CLIENT SETUP =====================

  GraphQLClient _createClient() {
    final httpLink = HttpLink(HttpConfig.baseUrl);

    final authLink = AuthLink(
      getToken: () async {
        _token = await _getAccessToken() ?? "";
        if (_token.isNotEmpty) {
          return 'Bearer $_token';
        }
        return null;
      },
    );

    // log request and response
    final loggingLink = Link.function((request, [forward]) {
      SUtils.logPrint("GraphQL Request URI: ${httpLink.uri}");
      SUtils.logPrint("Operation: ${request.operation.operationName}");
      SUtils.logPrint("Variables: ${request.variables}");

      return forward!(request).map((response) {
        if (response.errors != null) {
          SUtils.logPrint("GraphQL Errors: ${response.errors}");
        }
        SUtils.logPrint("GraphQL Response Data: ${response.data}");
        return response;
      });
    });

    final apiKeyLink = Link.function((request, [forward]) {
      return forward!(request);
    });

    final errorLink = ErrorLink(
      onGraphQLError: (request, forward, response) {
        for (final error in response.errors ?? []) {
          log('GraphQL Error: ${error.message}');
        }
        return forward(request);
      },
      onException: (request, forward, exception) async* {
        log('GraphQL Exception: $exception');

        if (_isUnauthorized(exception)) {
          final success = await _refreshToken();
          if (success) {
            yield* forward(request);
          } else {
            _forceLogout();
            throw Exception('UnAuthorized');
          }
        } else {
          yield* forward(request);
        }
      },
    );

    final link = apiKeyLink
        .concat(authLink)
        .concat(loggingLink)
        .concat(errorLink)
        .concat(httpLink);

    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );
  }

  // ===================== PUBLIC API =====================

  Future<AppResponse> query(
    String document, {
    Map<String, dynamic>? variables,
    FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
  }) async {
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(document),
          variables: variables ?? {},
          fetchPolicy: fetchPolicy,
        ),
      );

      if (result.hasException) {
        return _handleException(result.exception!);
      }

      return AppResponse.fromJson(result.data ?? {});
    } catch (e) {
      return AppResponse.withError(message: e.toString());
    }
  }

  Future<AppResponse> mutate(
    String document, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      final result = await _client.mutate(
        MutationOptions(document: gql(document), variables: variables ?? {}),
      );

      if (result.hasException) {
        return _handleException(result.exception!);
      }

      return AppResponse.fromJson(result.data ?? {});
    } catch (e) {
      return AppResponse.withError(message: e.toString());
    }
  }

  Stream<QueryResult> subscribe(
    String document, {
    Map<String, dynamic>? variables,
  }) {
    return _client.subscribe(
      SubscriptionOptions(document: gql(document), variables: variables ?? {}),
    );
  }

  // ===================== TOKEN HANDLING =====================

  Future<bool> _refreshToken() async {
    if (_isRefreshingToken && _refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _isRefreshingToken = true;
    _refreshCompleter = Completer<bool>();

    try {
      final refreshToken = await _getRefreshToken();
      if (refreshToken == null) {
        _refreshCompleter!.complete(false);
        return false;
      }

      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation RefreshToken(\$refresh: String!) {
              refreshToken(refresh: \$refresh) {
                access_token
                refresh_token
              }
            }
          '''),
          variables: {'refresh': refreshToken},
        ),
      );

      if (result.hasException) {
        _refreshCompleter!.complete(false);
        return false;
      }

      final data = result.data?['refreshToken'];
      if (data != null) {
        await _saveTokens(data['access_token'], data['refresh_token']);
        _refreshCompleter!.complete(true);
        return true;
      }
    } catch (e) {
      _refreshCompleter!.complete(false);
    } finally {
      _isRefreshingToken = false;
      _refreshCompleter = null;
    }

    return false;
  }

  void _forceLogout() async {
    await _clearTokens();
    _logoutController.add(true);
  }

  // ===================== STORAGE =====================

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await SStorageUtil.saveAuthData(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<void> _clearTokens() async {
    SStorageUtil.deleteAuthData();
  }

  Future<String?> _getAccessToken() async {
    return SStorageUtil.getData<String?>(key: SConstKeys.accessToken);
  }

  Future<String?> _getRefreshToken() async {
    return SStorageUtil.getData<String?>(key: SConstKeys.refreshToken);
  }

  // ===================== ERROR HANDLING =====================

  AppResponse _handleException(OperationException exception) {
    if (exception.graphqlErrors.isNotEmpty) {
      final message = exception.graphqlErrors.first.message;
      return AppResponse.withError(message: message);
    }

    if (exception.linkException != null) {
      final msg = exception.linkException.toString();
      return AppResponse.withError(message: msg);
    }

    return AppResponse.withError(message: "Something went wrong");
  }

  bool _isUnauthorized(Object exception) {
    final msg = exception.toString().toLowerCase();
    return msg.contains('401') || msg.contains('unauthorized');
  }
}

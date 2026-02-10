import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/configuration/api.dart';
import '../../../../../core/utils/storage_util.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final SApi api;
  late final StreamSubscription<void> _logoutSubscription;

  LogoutCubit(this.api) : super(LogoutInitial()) {
    _logoutSubscription = api.logoutStream.listen((_) {
      logout(isSessionExpired: true);
    });
  }

  Future<void> logout({bool isSessionExpired = false}) async {
    api.clearApiKey();
    await SStorageUtil.deleteAuthData();
    emit(LogoutSuccess(isSessionExpired: isSessionExpired));
  }

  void resetState() {
    emit(LogoutInitial());
  }

  @override
  Future<void> close() {
    _logoutSubscription.cancel();
    return super.close();
  }
}

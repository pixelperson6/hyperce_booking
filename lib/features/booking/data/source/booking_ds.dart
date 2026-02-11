// booking_ds.dart - speedzcode advance AI for lightning fast development

import 'dart:math';

import 'package:dartz/dartz.dart';
// import 'package:hyperce_booking/core/configuration/graph_ql.dart';
import 'package:hyperce_booking/core/utils/utils.dart';
import 'package:hyperce_booking/features/common/data/model/app_response_model.dart';
// import '../../../../core/configuration/api.dart';
// import '../../../../core/configuration/http_config.dart';
// import '../../../../core/di/app_locator.dart';
import '../../../../core/configuration/graph_ql.dart';
import '../../../../core/di/app_locator.dart';
import '../../../../core/utils/logarte_util.dart';
import '../../../../core/utils/typedef.dart';
import '../../../common/domain/entity/app_entity.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/entity/booking_param.dart';
import '../model/booking_model.dart';
import '../../domain/entity/get_layout_entity.dart';
import '../model/get_layout_model.dart';

abstract class BookingDs {
  ResultFuture<GetLayoutEntity> getLayout({required GetLayoutParam param});
}

class BookingRds implements BookingDs {
  const BookingRds();

  @override
  ResultFuture<GetLayoutEntity> getLayout({
    required GetLayoutParam param,
  }) async {
    // Mock GraphQL Query (simulated)
    const String getLayoutQuery = r'''
      query GetLayout($param: GetLayoutParam!) {
        getLayout(param: $param) {
          total_seats
          layout_id
          layout_name
          layout_description
          seats {
            id
            label
            position
            status
            online
            price
          }
        }
      }
    ''';

    // var apiRes = await sl<SApi>().get(
    //   HttpConfig.layout,
    //   queryParameters: param.toMap(),
    // );
    var graphQLRes = await sl<SGraphQLApi>().query(
      getLayoutQuery,
      variables: {"param": param.toMap()},
    );

    final random = Random();
    List<List<Map<String, dynamic>>> mockSeats = [];
    int rows = 5;
    int cols = 10;
    int totalSeats = rows * cols;

    for (int i = 0; i < rows; i++) {
      List<Map<String, dynamic>> row = [];
      for (int j = 0; j < cols; j++) {
        double rand = random.nextDouble();
        String status = "available";
        if (rand > 0.5) {
          status = "-";
        } else if (rand < 0.2) {
          status = "sold";
        }

        row.add({
          "id": "${i}_${j}",
          "label": "${String.fromCharCode(65 + i)}${j + 1}",
          "position": "1", // Default position
          "status": status,
          "online": "true",
          "price": 100.0 + (random.nextInt(3) * 20),
        });
      }
      mockSeats.add(row);
    }

    // Simulate network delay
    // await Future.delayed(const Duration(milliseconds: 200));

    var res = AppResponse(
      success: true,
      message: "Layout fetched successfully (Mock GraphQL)",
      data: {
        "total_seats": totalSeats,
        "layout_id": "mock_layout_${random.nextInt(100)}",
        "layout_name": "Premium Hall ${random.nextInt(5) + 1}",
        "layout_description": "Dolby Atmos Supported",
        "seats": mockSeats,
      },
    );

    if (res.isSuccess) {
      late GetLayoutModel data;
      try {
        data = GetLayoutModel.fromMap(res.data ?? {});
      } catch (e) {
        logarte.log("data parsing error: $e");
        SUtils.logPrint("data parsing error: $e");
        return Left("data parsing error: $e");
      }
      return Right(
        AppEntity(data: data, message: res.message, success: res.isSuccess),
      );
    } else {
      return Left(res.message ?? "something went wrong");
    }
  }
}

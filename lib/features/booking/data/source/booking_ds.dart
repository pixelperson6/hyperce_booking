// booking_ds.dart - speedzcode advance AI for lightning fast development

import 'package:dartz/dartz.dart';
import 'package:hyperce_booking/core/utils/utils.dart';
import 'package:hyperce_booking/features/common/data/model/app_response_model.dart';

import '../../../../core/configuration/api.dart';
import '../../../../core/configuration/http_config.dart';
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
    // var res = await sl<SApi>().get(
    //     HttpConfig.layout,

    //     queryParameters: param.toMap()
    //   );

    var res = AppResponse(
      success: true,
      message: "Layout fetched successfully",
      data: {
        "total_seats": 10,
        "layout_id": "1",
        "layout_name": "Layout 1",
        "layout_description": "Layout 1 Description",
        "seats": [
          [
            {
              "id": "1",
              "label": "A1",
              "position": "1",
              "status": "available",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "2",
              "label": "A1",
              "position": "1",
              "status": "available",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "3",
              "label": "A1",
              "position": "1",
              "status": "-",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "4",
              "label": "A1",
              "position": "1",
              "status": "available",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "5",
              "label": "A1",
              "position": "1",
              "status": "sold",
              "online": "true",
              "price": 100.0,
            },
          ],
          [
            {
              "id": "6",
              "label": "A1",
              "position": "1",
              "status": "available",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "7",
              "label": "A1",
              "position": "1",
              "status": "available",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "8",
              "label": "A1",
              "position": "1",
              "status": "-",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "9",
              "label": "A1",
              "position": "1",
              "status": "available",
              "online": "true",
              "price": 100.0,
            },
            {
              "id": "10",
              "label": "A1",
              "position": "1",
              "status": "sold",
              "online": "true",
              "price": 100.0,
            },
          ],
        ],
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

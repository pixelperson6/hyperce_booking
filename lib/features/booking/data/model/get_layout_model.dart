import 'package:hyperce_booking/features/common/data/model/layout_model.dart';

import '../../domain/entity/get_layout_entity.dart';

class GetLayoutModel extends GetLayoutEntity {
  GetLayoutModel({
    super.totalSeats,
    super.layoutId,
    super.layoutName,
    super.layoutDescription,
    super.seats,
  });

  factory GetLayoutModel.fromMap(Map<String, dynamic> json) => GetLayoutModel(
    totalSeats: (json['total_seats'] as num?)?.toInt(),
    layoutId: json['layout_id'],
    layoutName: json['layout_name'],
    layoutDescription: json['layout_description'],
    seats: (json['seats'] as List<dynamic>?)
        ?.map(
          (e) => (e as List<dynamic>?)
              ?.map((e) => LayoutModel.fromMap(e as Map<String, dynamic>))
              .toList(),
        )
        .toList(),
  );
}

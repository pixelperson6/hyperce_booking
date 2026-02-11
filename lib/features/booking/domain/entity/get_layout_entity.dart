import '../../../common/domain/entity/layout_entity.dart';

class GetLayoutEntity {
  final int? totalSeats;
  final String? layoutId;
  final String? layoutName;
  final String? layoutDescription;
  final List<List<LayoutEntity>?>? seats;

  GetLayoutEntity({
    this.totalSeats,
    this.layoutId,
    this.layoutName,
    this.layoutDescription,
    this.seats,
  });
}

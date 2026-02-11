import '../../domain/entity/layout_entity.dart';

class LayoutModel extends LayoutEntity {
  const LayoutModel({
    super.label,
    super.position,
    super.status,
    super.online,
    super.price,
  });

  factory LayoutModel.fromMap(Map<String, dynamic> data) => LayoutModel(
    label: data['label'] as String?,
    position: data['position'] as String?,
    status: data['status'] as String?,
    online: (data['online'] ?? false).toString(),
    price: (data['price'] ?? 0).toDouble(),
  );
}

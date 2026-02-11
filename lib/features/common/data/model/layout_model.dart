import '../../domain/entity/layout_entity.dart';

class LayoutModel extends LayoutEntity {
  const LayoutModel({
    super.id,
    super.label,
    super.position,
    super.status,
    super.online,
    super.price,
  });

  factory LayoutModel.fromMap(Map<String, dynamic> data) => LayoutModel(
    id: data['id'] as String?,
    label: data['label'] as String?,
    position: data['position'] as String?,
    status: data['status'] as String?,
    online: (data['online'] ?? false).toString(),
    price: (data['price'] ?? 0).toDouble(),
  );
}

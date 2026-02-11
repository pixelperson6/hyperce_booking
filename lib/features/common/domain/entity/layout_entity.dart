import 'package:equatable/equatable.dart';

class LayoutEntity extends Equatable {
  final String? id;
  final String? label;
  final String? position;
  final String? status;
  final String? online;
  final double? price;

  const LayoutEntity({
    this.id,
    this.label,
    this.position,
    this.status,
    this.online,
    this.price,
  });

  @override
  List<Object?> get props => [id];
}

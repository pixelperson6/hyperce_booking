import 'typedef.dart';

abstract class BaseUseCase<TypeEntity, Param extends BaseParam> {
  ResultFuture<TypeEntity> call({required Param param});
}

abstract class BaseParam {
  Map<String, dynamic> toMap();
}

final class EmptyParam extends BaseParam {
  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}

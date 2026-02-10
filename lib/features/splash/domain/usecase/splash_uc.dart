
// splash_uc.dart - speedzcode advance AI for lightning fast development
import '../../../../core/utils/base_util.dart';
import '../../../../core/utils/typedef.dart';
import '../entity/splash_entity.dart';
import '../entity/splash_param.dart';
import '../repository/splash_rp.dart';

class SplashUc extends BaseUseCase<SplashEntity, SplashParam> {
  final SplashRp _repository;
  
  SplashUc(this._repository);
  
  @override
  ResultFuture<SplashEntity> call({required SplashParam param}) {
    throw UnimplementedError();
  }
}
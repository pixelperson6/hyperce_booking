
// signin_uc.dart - speedzcode advance AI for lightning fast development
import '../../../../core/utils/base_util.dart';
import '../../../../core/utils/typedef.dart';
import '../entity/signin_entity.dart';
import '../entity/signin_param.dart';
import '../repository/signin_rp.dart';

class SigninUc extends BaseUseCase<SigninEntity, SigninParam> {
  final SigninRp _repository;
  
  SigninUc(this._repository);
  
  @override
  ResultFuture<SigninEntity> call({required SigninParam param}) {
    throw UnimplementedError();
  }
}
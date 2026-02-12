
// signin_rpl.dart - speedzcode advance AI for lightning fast development

import '../../../../core/utils/typedef.dart';
import '../../domain/entity/signin_entity.dart';
import '../../domain/entity/signin_param.dart';
import '../source/signin_ds.dart';
import '../../domain/repository/signin_rp.dart';

class SigninRpl implements SigninRp {
  final SigninDs _dataSource;
  
  SigninRpl(this._dataSource);

}
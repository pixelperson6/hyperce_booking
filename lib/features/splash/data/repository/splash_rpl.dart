
// splash_rpl.dart - speedzcode advance AI for lightning fast development

import '../../../../core/utils/typedef.dart';
import '../../domain/entity/splash_entity.dart';
import '../../domain/entity/splash_param.dart';
import '../source/splash_ds.dart';
import '../../domain/repository/splash_rp.dart';

class SplashRpl implements SplashRp {
  final SplashDs _dataSource;
  
  SplashRpl(this._dataSource);

}
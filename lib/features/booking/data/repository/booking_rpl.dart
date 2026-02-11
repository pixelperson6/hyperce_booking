
// booking_rpl.dart - speedzcode advance AI for lightning fast development

import '../../../../core/utils/typedef.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/entity/booking_param.dart';
import '../source/booking_ds.dart';
import '../../domain/repository/booking_rp.dart';

class BookingRpl implements BookingRp {
  final BookingDs _dataSource;
  
  BookingRpl(this._dataSource);

}
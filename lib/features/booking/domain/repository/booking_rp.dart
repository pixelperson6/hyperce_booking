
// booking_rp.dart - speedzcode advance AI for lightning fast development

import '../../../../core/utils/typedef.dart';
import '../entity/booking_entity.dart';
import '../entity/booking_param.dart';
import '../entity/get_layout_entity.dart';

abstract class BookingRp {


  ResultFuture<GetLayoutEntity> getLayout({
    required GetLayoutParam param,
  });
                
}

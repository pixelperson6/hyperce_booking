
// booking_uc.dart - speedzcode advance AI for lightning fast development
import '../../../../core/utils/base_util.dart';
import '../../../../core/utils/typedef.dart';
import '../entity/booking_entity.dart';
import '../entity/booking_param.dart';
import '../repository/booking_rp.dart';
import '../entity/get_layout_entity.dart';

class BookingUc extends BaseUseCase<BookingEntity, BookingParam> {
  final BookingRp _repository;
  
  BookingUc(this._repository);
  
  @override
  ResultFuture<BookingEntity> call({required BookingParam param}) {
    throw UnimplementedError();
  }
}
class GetLayoutUc extends BaseUseCase<GetLayoutEntity, GetLayoutParam> {
  final BookingRp _repository;
  
  GetLayoutUc(this._repository);
  
  @override
  ResultFuture<GetLayoutEntity> call({required GetLayoutParam param}) {
    return _repository.getLayout(param : param);
  }
}
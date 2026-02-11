
// booking_param.dart - speedzcode advance AI for lightning fast development

import '../../../../core/utils/base_util.dart';

class BookingParam extends BaseParam {
  BookingParam();

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}class GetLayoutParam extends BaseParam {
  String layoutId;

  GetLayoutParam({
    required this.layoutId,  });


  @override
  Map<String, dynamic> toMap() {
    return {
      'layout_id': layoutId,
  };
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/domain/entity/app_entity.dart';
import '../../../domain/entity/get_layout_entity.dart';
import '../../../domain/entity/booking_entity.dart';
import '../../../domain/entity/booking_param.dart';
import '../../../domain/usecase/booking_uc.dart';

part 'get_layout_state.dart';

class GetLayoutCubit extends Cubit<GetLayoutState> {
  
  final GetLayoutUc useCase;
  
  GetLayoutCubit({required this.useCase}) : super(GetLayoutInitial());

  AppEntity<GetLayoutEntity>? tempData;

  void getLayout({required GetLayoutParam param}) async {
    emit(GetLayoutLoading(data: tempData));
    
    final result = await useCase.call(param: param);
    result.fold(
      (message) => emit(GetLayoutFailure(message: message)), (data) {
        tempData = data;
        emit(GetLayoutSuccess(data: tempData));
      },
    );
  }
}

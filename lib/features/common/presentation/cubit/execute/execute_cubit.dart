import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/base_util.dart';
import 'execute_state.dart';

class ExecuteCubit extends Cubit<ExecuteState> {
  ExecuteCubit() : super(ExecuteInitialState());

  Future<void> execute<T>({
    required BaseParam param,
    required BaseUseCase<T, BaseParam> usecase,
  }) async {
    emit(ExecuteLoading());
    final returnedData = await usecase.call(param: param);
    returnedData.fold(
      (error) {
        emit(ExecuteFailureState(message: error));
      },
      (data) {
        emit(ExecuteSuccessState<T>(data: data.data));
      },
    );
  }
}

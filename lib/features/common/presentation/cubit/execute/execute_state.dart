abstract class ExecuteState {}

class ExecuteInitialState extends ExecuteState {}

class ExecuteLoading extends ExecuteState {}

class ExecuteSuccessState<T> extends ExecuteState {
  final T? data;
  ExecuteSuccessState({required this.data});
}

class ExecuteFailureState extends ExecuteState {
  final String message;
  ExecuteFailureState({required this.message});
}

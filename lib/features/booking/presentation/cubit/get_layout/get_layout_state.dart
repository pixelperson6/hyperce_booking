
part of 'get_layout_cubit.dart';

class GetLayoutState extends Equatable {
  const GetLayoutState({this.data});
  final AppEntity<GetLayoutEntity>? data;

  @override
  List<Object?> get props => [data];
}

class GetLayoutInitial extends GetLayoutState {}

class GetLayoutLoading extends GetLayoutState {
  const GetLayoutLoading({super.data});
}

class GetLayoutSuccess extends GetLayoutState {
  const GetLayoutSuccess({super.data});
}

class GetLayoutFailure extends GetLayoutState {
  final String message;
  
  const GetLayoutFailure({required this.message});
  
  @override
  List<Object> get props => [message];
}

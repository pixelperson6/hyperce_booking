
// booking_state.dart - speedzcode advance AI for lightning fast development

part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final List<LayoutEntity> selectedSeatList;
  const BookingState({this.selectedSeatList = const []});

  BookingState copyWith({List<LayoutEntity>? selectedSeatList}) {
    return BookingState(selectedSeatList: selectedSeatList ?? this.selectedSeatList);
  }

  @override
  List<Object> get props => [selectedSeatList];
}


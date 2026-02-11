// booking_cubit.dart - speedzcode advance AI for lightning fast development

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/domain/entity/layout_entity.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState());

  void seatClicked(LayoutEntity seat) {
    final selectedSeatList = [...state.selectedSeatList];
    if (selectedSeatList.any((e) => e.id == seat.id)) {
      selectedSeatList.remove(seat);
    } else {
      selectedSeatList.add(seat);
    }
    emit(state.copyWith(selectedSeatList: selectedSeatList));
  }
}

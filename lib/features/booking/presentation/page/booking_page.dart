// booking_page.dart - speedzcode advance AI for lightning fast development

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperce_booking/features/common/domain/entity/layout_entity.dart';
import 'package:hyperce_booking/features/common/presentation/widgets/seat_layout/seat_widget.dart';
import 'package:logarte/logarte.dart';

import '../../../../core/utils/logarte_util.dart';
import '../../../../core/values/spacing.dart';
import '../../../common/presentation/widgets/seat_layout/seat_layout_widget.dart';
import '../cubit/booking_cubit.dart';
import '../../domain/entity/booking_arg.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.arg});
  final BookingArg arg;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => BookingCubit())],
      child: BookingView(arg: arg),
    );
  }
}

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.arg});
  final BookingArg arg;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bookingCubit = context.read<BookingCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<BookingCubit, BookingState>(
          listener: (context, state) {
            // if (state is BookingSuccess) {
            // }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: LogarteMagicalTap(
            logarte: logarte,
            child: const Text('Booking View'),
          ),
        ),
        body: Container(
          padding: SSpacing.lgMargin,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<BookingCubit, BookingState>(
                  builder: (context, state) {
                    return SeatLayout(
                      selectedSeatList: state.selectedSeatList
                          .map((e) => e.id ?? "")
                          .toList(),
                      actionList: [
                        ActionSeatButtonEnum.enable,
                        ActionSeatButtonEnum.disable,
                      ],
                      isClickable: (seat, type) {
                        if (seat == null || type == SeatBoxType.desabled) {
                          return;
                        }

                        bookingCubit.seatClicked(seat);
                      },
                      subtitle: '',
                      seatLayout: [
                        [
                          LayoutEntity(
                            id: '0',
                            position: 'A1',
                            label: 'A1',
                            status: 'a',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '1',
                            position: 'A2',
                            label: 'A2',
                            status: '0',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '2',
                            position: 'A3',
                            label: 'A3',
                            status: '_',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '3',
                            position: 'A4',
                            label: 'A4',
                            status: 's',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '4',
                            position: 'A5',
                            label: 'A5',
                            status: 'd',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '5',
                            position: 'A6',
                            label: 'A6',
                            status: 'o',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '6',
                            position: 'A7',
                            label: 'A7',
                            status: '-',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '7',
                            position: 'A8',
                            label: 'A8',
                            status: '-',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '8',
                            position: 'A9',
                            label: 'A9',
                            status: 'a',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '9',
                            position: 'A10',
                            label: 'A10',
                            status: 'a',
                            price: 100,
                            online: 'true',
                          ),
                        ],
                        [
                          LayoutEntity(
                            id: '10',
                            position: 'A4',
                            label: 'A4',
                            status: 'a',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '11',
                            position: 'A5',
                            label: 'A5',
                            status: 'd',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '12',
                            position: 'A6',
                            label: 'A6',
                            status: 'a',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '13',
                            position: 'A7',
                            label: 'A7',
                            status: '-',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '14',
                            position: 'A8',
                            label: 'A8',
                            status: '-',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '15',
                            position: 'A9',
                            label: 'A9',
                            status: 'a',
                            price: 100,
                            online: 'true',
                          ),
                          LayoutEntity(
                            id: '16',
                            position: 'A10',
                            label: 'A10',
                            status: 'a',
                            price: 100,
                            online: 'true',
                          ),
                        ],
                      ],
                    );
                  },
                ),

                SSpacing.xlH,
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return Visibility(
              visible: state.selectedSeatList.isNotEmpty,
              child: Container(
                padding: SSpacing.bottomNavBarPadding(context),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: theme.colorScheme.secondaryContainer,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(
                            state.selectedSeatList.length.toString(),
                            style: theme.textTheme.titleSmall,
                          ),
                          SSpacing.smW,
                          const VerticalDivider(),
                          SSpacing.smW,
                          Expanded(
                            child: Text(
                              state.selectedSeatList
                                  .map((e) => e.label)
                                  .join(', '),
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                          SSpacing.mdW,
                          Text(
                            'Rs. ${state.selectedSeatList.fold(0.0, (sum, item) => sum + (item.price ?? 0.0))}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SSpacing.smH,
                    Divider(
                      color: theme.colorScheme.secondaryContainer,
                      height: 0.5,
                    ),
                    SSpacing.smH,
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.reset_tv),
                            label: Text("Reserve"),
                          ),
                        ),
                        SSpacing.mdW,
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.done),
                            label: Text("Book Now"),
                          ),
                        ),
                      ],
                    ),
                    SSpacing.smH,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

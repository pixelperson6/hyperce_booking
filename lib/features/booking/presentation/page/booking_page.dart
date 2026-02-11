// booking_page.dart - speedzcode advance AI for lightning fast development

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperce_booking/features/common/domain/entity/layout_entity.dart';
import 'package:hyperce_booking/features/common/presentation/widgets/seat_layout/seat_widget.dart';
import 'package:logarte/logarte.dart';

import '../../../../core/di/app_locator.dart';
import '../../../../core/utils/logarte_util.dart';
import '../../../../core/values/spacing.dart';
import '../../../common/presentation/widgets/seat_layout/seat_layout_widget.dart';
import '../../domain/entity/booking_param.dart';
import '../../domain/usecase/booking_uc.dart';
import '../cubit/booking_cubit.dart';
import '../../domain/entity/booking_arg.dart';
import '../cubit/get_layout/get_layout_cubit.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.arg});
  final BookingArg arg;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookingCubit()),
        BlocProvider(
          create: (_) =>
              GetLayoutCubit(useCase: sl<GetLayoutUc>())
                ..getLayout(param: GetLayoutParam(layoutId: "layout_1")),
        ),
      ],
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
    final getLayoutCubit = context.read<GetLayoutCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<BookingCubit, BookingState>(
          listener: (context, state) {
            // if (state is BookingSuccess) {
            // }
          },
        ),
        BlocListener<GetLayoutCubit, GetLayoutState>(
          listener: (context, state) {
            if (state is GetLayoutSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.data?.message ?? "Layout fetched successfully",
                  ),
                ),
              );
            }
            if (state is GetLayoutFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
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
                BlocBuilder<GetLayoutCubit, GetLayoutState>(
                  builder: (context, state) {
                    if (state is GetLayoutLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is GetLayoutFailure) {
                      return Center(child: Text(state.message));
                    }
                    if (state is GetLayoutSuccess) {
                      return BlocBuilder<BookingCubit, BookingState>(
                        builder: (context, bookingState) {
                          return SeatLayout(
                            selectedSeatList: bookingState.selectedSeatList
                                .map((e) => e.id ?? "")
                                .toList(),
                            actionList: [],
                            isClickable: (seat, type) {
                              if (seat == null ||
                                  type == SeatBoxType.desabled) {
                                return;
                              }
                              bookingCubit.seatClicked(seat);
                            },
                            subtitle: '',
                            seatLayout: state.data?.data?.seats ?? [],
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
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

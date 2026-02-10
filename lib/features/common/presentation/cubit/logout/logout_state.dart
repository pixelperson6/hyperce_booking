part of 'logout_cubit.dart';

abstract class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutSuccess extends LogoutState {
  final bool isSessionExpired;
  LogoutSuccess({required this.isSessionExpired});
}

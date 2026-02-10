import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/storage_util.dart';
import '../../../../core/values/const_keys.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    var isLoggedIn =
        await SStorageUtil.getData(key: SConstKeys.isLoggedIn) ?? false;
    // await Future.delayed(const Duration(seconds: 2));
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}

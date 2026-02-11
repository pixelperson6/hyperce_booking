import 'package:get_it/get_it.dart';
import '../../features/booking/domain/usecase/booking_uc.dart';

class UsecaseDi {
  UsecaseDi._();
  static final instance = UsecaseDi._();

  static void init(GetIt sl) {
    // Usecases

                
  
    sl.registerLazySingleton<GetLayoutUc>(() => GetLayoutUc(sl()));
                
  }
}

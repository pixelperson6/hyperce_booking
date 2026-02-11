import 'package:get_it/get_it.dart';
import '../../features/booking/data/repository/booking_rpl.dart';
import '../../features/booking/domain/repository/booking_rp.dart';


class RepoDi {
  RepoDi._();
  static final instance = RepoDi._();

  static void init(GetIt sl) {
    // Repositories


                
  
    sl.registerLazySingleton<BookingRp>(() => BookingRpl(sl()));
                
  }
}

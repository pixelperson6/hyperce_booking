import 'package:get_it/get_it.dart';
import '../../features/booking/data/source/booking_ds.dart';


class DataSourceDi {
  DataSourceDi._();
  static final instance = DataSourceDi._();

  static void init(GetIt sl) {
    // DataSource
        
  
    sl.registerLazySingleton<BookingDs>(() => BookingRds());
                
  }
}

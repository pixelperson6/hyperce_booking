import 'package:get_it/get_it.dart';

import '../../features/common/presentation/cubit/core/core_cubit.dart';
import '../configuration/api.dart';
import 'datasource_di.dart';
import 'repo_di.dart';
import 'usecase_di.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // API
  sl.registerSingleton<SApi>(SApi());
  // Datasources
  DataSourceDi.init(sl);
  // Repositories
  RepoDi.init(sl);
  // Usecases
  UsecaseDi.init(sl);

  sl.registerSingleton<CoreCubit>(CoreCubit());
}

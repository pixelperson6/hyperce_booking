import 'package:dartz/dartz.dart';

import '../../features/common/domain/entity/app_entity.dart';

typedef ResultFuture<T> = Future<Either<String, AppEntity<T>>>;

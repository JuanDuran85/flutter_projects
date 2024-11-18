// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/infrastructure.dart';

final Provider<LocalStorageRepositoryImpl> localStoreRepositoryProvider =
    Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});

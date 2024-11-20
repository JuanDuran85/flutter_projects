// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';

// final favoriteMoviesProvider = StateNotifierProvider((ref) {
//   return;
// });

class StorageMoviesNotifies extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifies({
    required this.localStorageRepository,
  }) : super(const {});


  
}

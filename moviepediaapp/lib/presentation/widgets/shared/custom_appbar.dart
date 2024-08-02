import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../presentation.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeOfColors = Theme.of(context).colorScheme;
    final themeOfStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: themeOfColors.primary),
              const SizedBox(width: 5),
              Text('MoviePedia', style: themeOfStyle),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final searchedMovies = ref.read(searchedMoviesProvider);
                    final searchQuery = ref.read(searchQueryProvider);

                    showSearch<Movie?>(
                      query: searchQuery,
                      context: context,
                      delegate: SearchMovieDelegates(
                          initialMovies: searchedMovies,
                          searchMovie: ref
                              .read(searchedMoviesProvider.notifier)
                              .searchMoviesByQuery),
                    ).then((valueMovie) {
                      if (valueMovie == null) return;
                      context.push('/movie/${valueMovie.id}');
                    });
                  },
                  color: themeOfColors.primary,
                  icon: const Icon(Icons.search_outlined))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    final MovieRepositoryImpl movieRepository =
                        ref.read(movieRepositoryProvider);

                    showSearch(
                      context: context,
                      delegate: SearchMovieDelegates(
                          searchMovie: movieRepository.searchMovies),
                    );
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

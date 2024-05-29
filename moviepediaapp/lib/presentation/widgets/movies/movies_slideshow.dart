import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:card_swiper/card_swiper.dart';

import 'package:moviepediaapp/domain/entities/movie_entities.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final themeOfColors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: themeOfColors.primary,
                color: themeOfColors.secondary)),
        itemCount: movies.length,
        itemBuilder: (context, index) => _SlideMovie(movie: movies[index]),
      ),
    );
  }
}

class _SlideMovie extends StatelessWidget {
  final Movie movie;

  const _SlideMovie({required this.movie});

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }

              return child;
            },
          ),
        ),
      ),
    );
  }
}

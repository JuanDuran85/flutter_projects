import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:animate_do/animate_do.dart';
import 'package:moviepediaapp/config/helpers/random_number.dart';
import '../../../domain/domain.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;

  const MoviePosterLink({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay:
          Duration(milliseconds: RandomNumberGenerator.generateRandomNumber()),
      child: GestureDetector(
        onTap: () => context.push('/home/0/movie/${movie.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(movie.posterPath),
        ),
      ),
    );
  }
}

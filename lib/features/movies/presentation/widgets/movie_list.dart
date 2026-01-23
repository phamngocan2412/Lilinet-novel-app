import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';
import 'movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onMovieTap;
  final String? heroTagPrefix;

  const MovieList({
    super.key,
    required this.movies,
    required this.onMovieTap,
    this.heroTagPrefix,
  });

  @override
  Widget build(BuildContext context) {
    const int crossAxisCount = 2;
    const double crossAxisSpacing = 12;
    const double padding = 16;

    // Calculate precise memory cache size based on screen width and device pixel ratio.
    // Logic: (Screen Width - Padding - Spacing) / Columns * DevicePixelRatio
    final double screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth = (screenWidth - (padding * 2) - ((crossAxisCount - 1) * crossAxisSpacing)) / crossAxisCount;
    final int memCacheWidth = (itemWidth * MediaQuery.of(context).devicePixelRatio).toInt();

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.7,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: 12,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final movie = movies[index];
          return MovieCard(
            movie: movie,
            heroTag:
                heroTagPrefix != null ? '${heroTagPrefix}_${movie.id}' : null,
            onTap: () => onMovieTap(movie),
            memCacheWidth: memCacheWidth,
          );
        },
        childCount: movies.length,
        addAutomaticKeepAlives: false, // Reduce memory overhead
        addRepaintBoundaries: true, // Optimize repaints
      ),
    );
  }
}

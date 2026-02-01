import 'package:injectable/injectable.dart';
import '../../features/movies/domain/entities/movie.dart';

/// Service for detecting whether content is anime or not
///
/// Uses multiple heuristics:
/// 1. Check if movie has Animation genre (TMDB genre ID 16)
/// 2. Check origin country (JP, KR are likely anime)
/// 3. Check for anime keywords in title
/// 4. TV Series + Animation fallback
@injectable
class AnimeDetectionService {
  /// TMDB Animation genre
  static const int animationGenreId = 16;

  /// Countries likely to produce anime
  static const List<String> animeCountries = ['JP', 'KR'];

  /// Common anime keywords in titles
  static const List<String> animeKeywords = [
    'jujutsu',
    'naruto',
    'one piece',
    'bleach',
    'dragon ball',
    'attack on titan',
    'demon slayer',
    'my hero',
    'hunter',
    'tokyo',
    'sword art',
    'fullmetal',
    'death note',
    'code geass',
    'one punch',
    'gintama',
    'fairy tail',
    'hunter x hunter',
    'boku no hero',
    'kimetsu no yaiba',
    'shingeki no kyojin',
    'shippuden',
    'boruto',
    'nanatsu no taizai',
    'overlord',
    're:zero',
    'steins',
    'fma',
    'sao',
    'aot',
    'bnha',
    'jjk',
  ];

  /// Detect if content is anime
  ///
  /// Returns true if content is likely anime, false otherwise
  bool isAnime(Movie movie, String type) {
    // 1. Check if has Animation genre
    final hasAnimation = movie.genres.any(
      (g) => g.toLowerCase().contains('animation'),
    );

    if (!hasAnimation) {
      return false;
    }

    // 2. Check origin country if available
    // Note: This requires movie to have originCountry field
    // For now, we check if we can extract it from any available data

    // 3. Check for anime keywords in title
    final title = movie.title.toLowerCase();
    final hasAnimeKeyword = animeKeywords.any(
      (keyword) => title.contains(keyword),
    );

    if (hasAnimeKeyword) {
      return true;
    }

    // 4. TV Series + Animation = likely anime (but not guaranteed)
    // This is a fallback and might misclassify western animation
    if (type.toLowerCase().contains('tv')) {
      return true;
    }

    return false;
  }

  /// Get detection reason for debugging
  String getDetectionReason(Movie movie, String type) {
    final title = movie.title.toLowerCase();
    final hasAnimation = movie.genres.any(
      (g) => g.toLowerCase().contains('animation'),
    );

    if (!hasAnimation) {
      return 'No Animation genre';
    }

    final hasAnimeKeyword = animeKeywords.any(
      (keyword) => title.contains(keyword),
    );

    if (hasAnimeKeyword) {
      final matchedKeyword = animeKeywords.firstWhere(
        (keyword) => title.contains(keyword),
      );
      return 'Animation genre + anime keyword: "$matchedKeyword"';
    }

    if (type.toLowerCase().contains('tv')) {
      return 'Animation genre + TV Series (fallback)';
    }

    return 'Animation genre but inconclusive';
  }
}

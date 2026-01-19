import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/get_streaming_links.dart';
import '../../../domain/usecases/get_movie_details.dart';
import '../../../domain/usecases/search_movies.dart';
import '../../../domain/entities/movie.dart'; // Import Movie for casting
import 'streaming_state.dart';

@injectable
class StreamingCubit extends Cubit<StreamingState> {
  final GetStreamingLinks _getStreamingLinks;
  final GetMovieDetails _getMovieDetails;
  final SearchMovies _searchMovies;

  StreamingCubit(
    this._getStreamingLinks,
    this._getMovieDetails,
    this._searchMovies,
  ) : super(StreamingInitial());

  // Valid servers
  static const _servers = ['vidcloud', 'upcloud', 'megaup'];

  // Backup providers
  static const _animeProviders = ['zoro', 'gogoanime', 'animepahe', 'animekai'];
  static const _movieProviders = ['flixhq', 'viewasian'];

  Future<void> loadLinks({
    required String episodeId,
    required String mediaId,
    required int episodeNumber,
    String? server,
    String provider = 'animepahe',
    String type = 'TV Series',
    String? movieTitle,
  }) async {
    if (isClosed) return;
    emit(StreamingLoading());

    // 1. Try the requested provider first
    bool success = await _tryProvider(provider, episodeId, mediaId, server);
    if (success) return;

    if (server != null) return;

    print('⚠️ Primary provider $provider failed. Attempting fallbacks...');

    final isAnime = _animeProviders.contains(provider);
    final backups = isAnime ? _animeProviders : _movieProviders;

    for (final backup in backups) {
      if (backup == provider) continue;

      print('🔄 Switching to fallback provider: $backup');

      String? newEpisodeId;

      // Method 1: Get Details by ID
      final detailsResult = await _getMovieDetails(
        GetMovieDetailsParams(
          id: mediaId,
          type: type,
          provider: backup,
          fastMode: false,
        ),
      );

      detailsResult.fold((failure) {}, (movie) {
        newEpisodeId = _findEpisodeId(movie, episodeNumber);
      });

      // Method 2: Search by Title (Not implemented fully yet as we need provider context in search)
      // But if we fail ID lookup, we could try guessing? No.

      if (newEpisodeId == null) {
        print('   ❌ Could not find episode ID for $backup (Lookup failed)');
        continue;
      }

      print('   ✅ Found new Episode ID: $newEpisodeId');

      success = await _tryProvider(backup, newEpisodeId!, mediaId, null);
      if (success) return;
    }

    if (!isClosed && state is! StreamingLoaded) {
      emit(
        const StreamingError(
          'No streaming links available. Please try a different server or provider in Settings.',
        ),
      );
    }
  }

  String? _findEpisodeId(Movie movie, int episodeNumber) {
    if (movie.episodes == null || movie.episodes!.isEmpty) return null;

    if (movie.type.toLowerCase() == 'movie') {
      return movie.episodes!.first.id;
    }

    try {
      final ep = movie.episodes!.firstWhere((e) => e.number == episodeNumber);
      return ep.id;
    } catch (_) {
      return movie.episodes!.first.id;
    }
  }

  Future<bool> _tryProvider(
    String provider,
    String episodeId,
    String mediaId,
    String? specificServer,
  ) async {
    if (specificServer != null) {
      final result = await _getStreamingLinks(
        episodeId: episodeId,
        mediaId: mediaId,
        server: specificServer,
        provider: provider,
      );

      bool found = false;
      if (isClosed) return false;

      result.fold((failure) {}, (response) {
        _emitLoaded(response, provider, specificServer);
        found = true;
      });
      return found;
    }

    for (final s in _servers) {
      if (isClosed) return false;

      final result = await _getStreamingLinks(
        episodeId: episodeId,
        mediaId: mediaId,
        server: s,
        provider: provider,
      );

      if (isClosed) return false;

      bool found = false;
      result.fold((_) {}, (response) {
        if (response.links.isNotEmpty) {
          _emitLoaded(response, provider, s);
          found = true;
        }
      });

      if (found) return true;
    }

    return false;
  }

  void _emitLoaded(dynamic response, String provider, String server) {
    if (!isClosed) {
      print('✅ Streaming links loaded successfully:');
      print('  Provider: $provider');
      print('  Server: $server');
      print('  Sources: ${response.links.length}');

      emit(
        StreamingLoaded(
          links: response.links,
          selectedServer: server,
          subtitles: response.subtitles,
          activeProvider: provider,
        ),
      );
    }
  }
}

import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:lilinet_app/features/video_player/presentation/bloc/video_player_state.dart';

@lazySingleton
class VideoSessionRepository {
  static const String boxName = 'video_session';
  static const String key = 'last_session';

  Future<Box> get _box async => await Hive.openBox(boxName);

  Future<void> saveSession({
    required VideoPlayerState state,
    required Duration position,
  }) async {
    final box = await _box;
    await box.put(key, {
      'episodeId': state.episodeId,
      'mediaId': state.mediaId,
      'title': state.title,
      'posterUrl': state.posterUrl,
      'episodeTitle': state.episodeTitle,
      'mediaType': state.mediaType,
      'positionSeconds': position.inSeconds,
      'timestamp': DateTime.now().toIso8601String(),
      // We don't save the full Movie object here as it's too complex.
      // We will reload it using the mediaId/episodeId.
    });
  }

  Future<Map<String, dynamic>?> getLastSession() async {
    final box = await _box;
    final session = box.get(key);

    if (session != null) {
      final timestamp = DateTime.parse(session['timestamp']);
      // Only restore if < 24 hours old
      if (DateTime.now().difference(timestamp).inHours < 24) {
        return Map<String, dynamic>.from(session);
      } else {
        await clearSession();
      }
    }
    return null;
  }

  Future<void> clearSession() async {
    final box = await _box;
    await box.delete(key);
  }
}

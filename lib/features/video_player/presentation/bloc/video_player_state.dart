import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../features/movies/domain/entities/movie.dart';

part 'video_player_state.freezed.dart';

enum VideoPlayerStatus { closed, minimized, expanded }

@freezed
abstract class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState({
    @Default(VideoPlayerStatus.closed) VideoPlayerStatus status,
    String? episodeId,
    String? mediaId,
    String? title,
    String? posterUrl,
    String? episodeTitle,
    Duration? startPosition,
    String? mediaType,
    Movie? movie,
    int? timestamp,
  }) = _VideoPlayerState;
}

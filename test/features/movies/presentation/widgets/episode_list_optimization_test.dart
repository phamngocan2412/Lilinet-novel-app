import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lilinet_app/features/history/domain/entities/watch_progress.dart';
import 'package:lilinet_app/features/movies/domain/entities/episode.dart';
import 'package:lilinet_app/features/movies/presentation/widgets/episode_list.dart';
import 'package:lilinet_app/features/movies/presentation/widgets/episode_sliver_list.dart';

void main() {
  const episode1 = Episode(
    id: 'ep1',
    title: 'Episode 1',
    number: 1,
    image: '', // Empty to avoid network calls
  );

  const episode2 = Episode(
    id: 'ep2',
    title: 'Episode 2',
    number: 2,
    image: '',
  );

  final episodes = [episode1, episode2];
  const mediaId = 'movie1';

  final progress1 = WatchProgress(
    mediaId: mediaId,
    episodeId: 'ep1',
    title: 'Movie 1',
    episodeTitle: 'Episode 1',
    positionSeconds: 50,
    durationSeconds: 100,
    lastUpdated: DateTime.now(),
    isFinished: false,
    posterUrl: '',
  );

  final watchProgress = [progress1];

  group('EpisodeList Optimization Test', () {
    testWidgets('EpisodeList renders correctly with progress',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EpisodeList(
              episodes: episodes,
              mediaId: mediaId,
              watchProgress: watchProgress,
              onEpisodeTap: (_) {},
            ),
          ),
        ),
      );

      // Verify episodes are rendered
      expect(find.text('Episode 1'), findsOneWidget);
      expect(find.text('Episode 2'), findsOneWidget);

      // Verify progress indicator is shown for episode 1
      // EpisodeItem shows LinearProgressIndicator if progress > 0
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('EpisodeSliverList renders correctly with progress',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                EpisodeSliverList(
                  episodes: episodes,
                  mediaId: mediaId,
                  watchProgress: watchProgress,
                  onEpisodeTap: (_) {},
                ),
              ],
            ),
          ),
        ),
      );

      // Verify episodes are rendered
      expect(find.text('Episode 1'), findsOneWidget);
      expect(find.text('Episode 2'), findsOneWidget);

      // Verify progress indicator is shown for episode 1
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
  });
}

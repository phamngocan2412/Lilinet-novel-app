import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../movies/presentation/bloc/streaming/streaming_cubit.dart';
import '../../../movies/presentation/bloc/streaming/streaming_state.dart';
import '../bloc/video_player_state.dart';
import 'package:lilinet_app/features/settings/domain/entities/app_settings.dart';
import 'comment_section.dart';

const kOrangeColor = Color(0xFFC6A664);
const kGreenVIP = Color(0xFF43A047);
const kBlueVIP = Color(0xFF1E88E5);

class ExpandedPlayerContent extends StatelessWidget {
  final VideoPlayerState state;
  final String currentServer;
  final VideoQuality defaultQuality;
  final Function(String) onServerSelected;
  final Function(
    String url,
    String? subUrl,
    String? subLang,
    Map<String, String>? headers,
  )
  onQualitySelected;

  const ExpandedPlayerContent({
    super.key,
    required this.state,
    required this.currentServer,
    required this.defaultQuality,
    required this.onServerSelected,
    required this.onQualitySelected,
  });

  Widget _buildVipButton(
    String label,
    Color color,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? color : Colors.transparent,
        foregroundColor: isSelected ? Colors.white : color,
        side: BorderSide(color: color),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamingCubit, StreamingState>(
      builder: (context, streamingState) {
        String? description;
        final movie = state.movie;
        if (movie != null) {
          description = movie.description;
        }

        return Column(
          children: [
            // Top Section: Details & Controls (Scrollable)
            Expanded(
              flex: 4,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    '${state.title}${state.episodeTitle != null ? " - ${state.episodeTitle}" : ""}',
                    style: const TextStyle(
                      color: kOrangeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Provider & Server Info
                  if (streamingState is StreamingLoaded)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.cloud_done, size: 14, color: kGreenVIP),
                          const SizedBox(width: 4),
                          Text(
                            'Source: ${streamingState.activeProvider.toUpperCase()}',
                            style: TextStyle(
                              color: kGreenVIP,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Server Selector
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text(
                          'Server',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 8),
                        _buildVipButton(
                          'VidCloud',
                          kGreenVIP,
                          currentServer == 'vidcloud',
                          () => onServerSelected('vidcloud'),
                        ),
                        const SizedBox(width: 8),
                        _buildVipButton(
                          'UpCloud',
                          kBlueVIP,
                          currentServer == 'upcloud',
                          () => onServerSelected('upcloud'),
                        ),
                        const SizedBox(width: 8),
                        _buildVipButton(
                          'VidStream',
                          kOrangeColor,
                          currentServer == 'vidstream',
                          () => onServerSelected('vidstream'),
                        ),
                        const SizedBox(width: 8),
                        _buildVipButton(
                          'MixDrop',
                          const Color(0xFF8E24AA),
                          currentServer == 'mixdrop',
                          () => onServerSelected('mixdrop'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Quality Selector
                  if (streamingState is StreamingLoaded &&
                      streamingState.links.isNotEmpty) ...[
                    Builder(
                      builder: (context) {
                        final uniqueLinks = <String, dynamic>{};
                        for (var link in streamingState.links) {
                          if (!uniqueLinks.containsKey(link.quality)) {
                            uniqueLinks[link.quality] = link;
                          }
                        }
                        if (uniqueLinks.length <= 1)
                          return const SizedBox.shrink();

                        return Container(
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const Center(
                                child: Text(
                                  "Quality: ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ...uniqueLinks.entries.map((entry) {
                                final link = entry.value;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: kOrangeColor,
                                      ),
                                      foregroundColor: kOrangeColor,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    onPressed: () {
                                      String? subUrl;
                                      String? subLang;
                                      if (streamingState.subtitles != null &&
                                          streamingState
                                              .subtitles!
                                              .isNotEmpty) {
                                        try {
                                          final englishSub = streamingState
                                              .subtitles!
                                              .firstWhere(
                                                (s) => s.lang
                                                    .toLowerCase()
                                                    .contains('english'),
                                              );
                                          subUrl = englishSub.url;
                                          subLang = englishSub.lang;
                                        } catch (_) {}
                                      }
                                      onQualitySelected(
                                        link.url,
                                        subUrl,
                                        subLang,
                                        link.headers,
                                      );
                                    },
                                    child: Text(entry.key.toUpperCase()),
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      },
                    ),
                  ],

                  if (description != null) ...[
                    Text(
                      description,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),

            const Divider(height: 1, color: Colors.white24),

            // Bottom Section: Comments
            Expanded(
              flex: 6,
              child: CommentSection(
                videoId: state.mediaId ?? 'unknown',
                movieTitle: state.title ?? 'Unknown Title',
                movieType: state.mediaType ?? 'TV Series',
              ),
            ),
          ],
        );
      },
    );
  }
}

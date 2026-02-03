import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../movies/presentation/bloc/streaming/streaming_cubit.dart';
import '../../../movies/presentation/bloc/streaming/streaming_state.dart';
import '../bloc/video_player_state.dart';
import 'package:lilinet_app/features/settings/domain/entities/app_settings.dart';
import '../../../comments/presentation/widgets/collapsed_comment_view.dart';
import '../../../../core/widgets/cached_image.dart';

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
  final VoidCallback onMinimize;
  final VoidCallback onDownload;

  const ExpandedPlayerContent({
    super.key,
    required this.state,
    required this.currentServer,
    required this.defaultQuality,
    required this.onServerSelected,
    required this.onQualitySelected,
    required this.onMinimize,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamingCubit, StreamingState>(
      builder: (context, streamingState) {
        String? description;
        final movie = state.movie;
        if (movie != null) {
          description = movie.description;
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            // Build the scrollable content
            final contentChildren = _buildContentChildren(
              context,
              streamingState,
              description,
            );

            // If height is too small, make entire content scrollable
            if (constraints.maxHeight < 400) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contentChildren,
                ),
              );
            }

            // Normal layout with split sections
            return Column(
              children: [
                // Main Content: Details, Controls & Recommendations (Scrollable)
                Expanded(
                  flex: 9,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      ...contentChildren,
                      const SizedBox(height: 24),
                      // Recommendations Section
                      if (state.movie?.recommendations != null &&
                          state.movie!.recommendations!.isNotEmpty) ...[
                        const Text(
                          'Đề xuất cho bạn',
                          style: TextStyle(
                            color: kOrangeColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildRecommendations(context),
                      ],
                    ],
                  ),
                ),

                const Divider(height: 1, color: Colors.white24),

                // Collapsed Comment Preview (Tap to expand full sheet) - Minimized
                CollapsedCommentView(
                  videoId: state.mediaId ?? 'unknown',
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        );
      },
    );
  }

  List<Widget> _buildContentChildren(
    BuildContext context,
    StreamingState streamingState,
    String? description,
  ) {
    return [
      // Title
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${state.title}${state.episodeTitle != null ? " - ${state.episodeTitle}" : ""}',
              style: const TextStyle(
                color: kOrangeColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: onDownload,
            icon: const Icon(Icons.download_rounded),
            color: Colors.white,
            tooltip: 'Download',
          ),
        ],
      ),
      const SizedBox(height: 16),

      // Server Selector - Dynamic based on available servers
      _buildServerSelector(streamingState),
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
            if (uniqueLinks.length <= 1) {
              return const SizedBox.shrink();
            }

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
                          side: const BorderSide(color: kOrangeColor),
                          foregroundColor: kOrangeColor,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () {
                          String? subUrl;
                          String? subLang;
                          if (streamingState.subtitles != null &&
                              streamingState.subtitles!.isNotEmpty) {
                            try {
                              final englishSub = streamingState.subtitles!
                                  .firstWhere(
                                    (s) => s.lang.toLowerCase().contains(
                                      'english',
                                    ),
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

      // Description
      if (description != null) ...[
        Text(
          description,
          style: const TextStyle(color: Colors.grey),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
      ],
    ];
  }

  Widget _buildVipButton(
    String label,
    Color color,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(4),
          border: isSelected
              ? Border.all(color: Colors.white, width: 1)
              : Border.all(color: Colors.transparent),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildServerSelector(StreamingState streamingState) {
    // Get available servers from state, or use defaults
    List<String> servers = ['vidcloud', 'upcloud', 'megaup'];

    if (streamingState is StreamingLoaded &&
        streamingState.availableServers != null &&
        streamingState.availableServers!.isNotEmpty) {
      servers = streamingState.availableServers!;
    }

    // Map server names to display labels and colors
    final serverConfig = <String, ({String label, Color color})>{
      'vidcloud': (label: 'VidCloud', color: kGreenVIP),
      'upcloud': (label: 'UpCloud', color: kBlueVIP),
      'megaup': (label: 'MegaUp', color: const Color(0xFF8E24AA)),
      'vidstreaming': (label: 'VidStream', color: kOrangeColor),
      'mixdrop': (label: 'MixDrop', color: const Color(0xFF8E24AA)),
      'streamsb': (label: 'StreamSB', color: const Color(0xFFE53935)),
      'streamtape': (label: 'StreamTape', color: const Color(0xFF00897B)),
      'filemoon': (label: 'FileMoon', color: const Color(0xFF5E35B1)),
      'mp4upload': (label: 'MP4Upload', color: const Color(0xFF6D4C41)),
    };

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Text('Server', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 8),
          ...servers.map((server) {
            final serverLower = server.toLowerCase();
            final config = serverConfig[serverLower];
            final label = config?.label ?? _capitalizeServer(server);
            final color = config?.color ?? kOrangeColor;

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildVipButton(
                label,
                color,
                currentServer.toLowerCase() == serverLower,
                () => onServerSelected(serverLower),
              ),
            );
          }),
        ],
      ),
    );
  }

  String _capitalizeServer(String server) {
    if (server.isEmpty) return server;
    return server[0].toUpperCase() + server.substring(1);
  }

  Widget _buildRecommendations(BuildContext context) {
    final recommendations = state.movie?.recommendations ?? [];
    if (recommendations.isEmpty) return const SizedBox.shrink();

    // Calculate optimal cache width for performance
    final screenWidth = MediaQuery.of(context).size.width;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final itemWidth = (screenWidth - 32 - 12) / 3; // 3 columns
    final memCacheWidth = (itemWidth * devicePixelRatio).toInt();

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final item = recommendations[index];
          return GestureDetector(
            onTap: () {
              if (item.id.isEmpty) return;
              context.push(
                '/movie/${item.id}?type=${item.type}',
                extra: item,
              );
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AppCachedImage(
                        imageUrl: item.poster ?? item.cover ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        memCacheWidth: memCacheWidth,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../injection_container.dart';
import '../../../video_player/presentation/bloc/comments/comments_cubit.dart';
import '../../../video_player/data/models/comment_model.dart';

class FeaturedCommentsSection extends StatefulWidget {
  const FeaturedCommentsSection({super.key});

  @override
  State<FeaturedCommentsSection> createState() =>
      _FeaturedCommentsSectionState();
}

class _FeaturedCommentsSectionState extends State<FeaturedCommentsSection> {
  List<CommentModel> _comments = [];

  // ... (inside State class)
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _loadFeaturedComments();
    _subscription = getIt<CommentsCubit>().onCommentsUpdated.listen((_) {
      if (mounted) _loadFeaturedComments();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _loadFeaturedComments() {
    // Get real comments from Hive storage
    final comments = getIt<CommentsCubit>().getFeaturedComments();
    if (mounted) {
      setState(() {
        _comments = comments;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_comments.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'COMMUNITY BUZZ',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140, // Height for the cards
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _comments.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final comment = _comments[index];
              return _buildCommentCard(context, comment);
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildCommentCard(BuildContext context, CommentModel comment) {
    return GestureDetector(
      onTap: () {
        if (comment.movieId.isNotEmpty) {
          context.push(
            '/movie/${Uri.encodeComponent(comment.movieId)}?type=${comment.movieType}',
          );
        }
      },
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.outlineVariant.withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: User & Movie
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    comment.userName[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    comment.userName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Content
            Expanded(
              child: Text(
                '"${comment.content}"',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Footer: Movie Name
            Row(
              children: [
                Icon(
                  Icons.movie_creation_outlined,
                  size: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    comment.movieTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/comment.dart';
import '../../domain/repositories/comment_repository.dart';
import '../../../../injection_container.dart';

class HomeTrendingSection extends StatelessWidget {
  const HomeTrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeTrendingCubit>()..loadTrendingComments(),
      child: const _HomeTrendingSectionView(),
    );
  }
}

class _HomeTrendingSectionView extends StatelessWidget {
  const _HomeTrendingSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTrendingCubit, HomeTrendingState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildLoadingShimmer(context),
          loaded: (comments) => _buildTrendingList(context, comments),
          empty: () => const SizedBox.shrink(),
          error: (message) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildLoadingShimmer(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        cacheExtent: 300,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 280,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingList(BuildContext context, List<Comment> comments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'BÌNH LUẬN NỔI BẬT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(width: 8),
              const Text('🔥', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView.builder(
            cacheExtent: 300,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return _TrendingCommentCard(
                comment: comment,
                onTap: () {
                  // Navigate to video with comment highlight
                  // Use mediaType from comment, default to 'TV Series' if not available
                  final mediaType = comment.mediaType ?? 'TV Series';
                  context.push(
                    '/movie/${comment.videoId}?type=$mediaType',
                    extra: {'highlightCommentId': comment.id},
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _TrendingCommentCard extends StatelessWidget {
  final Comment comment;
  final VoidCallback onTap;

  const _TrendingCommentCard({
    super.key,
    required this.comment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info row
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(comment.avatarUrl),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        comment.timeAgo,
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                // Trending badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.trending_up,
                        size: 12,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        comment.trendingScore.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Comment content
            Expanded(
              child: Text(
                comment.content,
                style: const TextStyle(fontSize: 13, height: 1.3),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 8),

            // Stats row
            Row(
              children: [
                Icon(Icons.thumb_up, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${comment.likes}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(width: 16),
                Icon(Icons.comment, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${comment.repliesCount}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// State Management for Trending Comments
abstract class HomeTrendingState {
  const HomeTrendingState();

  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<Comment> comments) loaded,
    required T Function() empty,
    required T Function(String message) error,
  }) {
    if (this is HomeTrendingInitial) return initial();
    if (this is HomeTrendingLoading) return loading();
    if (this is HomeTrendingLoaded)
      return loaded((this as HomeTrendingLoaded).comments);
    if (this is HomeTrendingEmpty) return empty();
    if (this is HomeTrendingError)
      return error((this as HomeTrendingError).message);
    throw Exception('Unknown state');
  }
}

class HomeTrendingInitial extends HomeTrendingState {}

class HomeTrendingLoading extends HomeTrendingState {}

class HomeTrendingLoaded extends HomeTrendingState {
  final List<Comment> comments;
  const HomeTrendingLoaded(this.comments);
}

class HomeTrendingEmpty extends HomeTrendingState {}

class HomeTrendingError extends HomeTrendingState {
  final String message;
  const HomeTrendingError(this.message);
}

@injectable
class HomeTrendingCubit extends Cubit<HomeTrendingState> {
  final CommentRepository _repository;

  HomeTrendingCubit(this._repository) : super(HomeTrendingInitial());

  Future<void> loadTrendingComments() async {
    emit(HomeTrendingLoading());

    final result = await _repository.getTrendingComments(limit: 5);

    result.fold((failure) => emit(HomeTrendingError(failure.message)), (
      comments,
    ) {
      if (comments.isEmpty) {
        emit(HomeTrendingEmpty());
      } else {
        emit(HomeTrendingLoaded(comments));
      }
    });
  }

  Future<void> refreshTrendingComments() async {
    await loadTrendingComments();
  }
}

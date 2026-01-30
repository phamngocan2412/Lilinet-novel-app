import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../presentation/manager/comment_cubit.dart';
import '../../presentation/manager/comment_state.dart';
import 'comment_bottom_sheet.dart';

class CollapsedCommentView extends StatelessWidget {
  final String videoId;

  const CollapsedCommentView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CommentCubit>()..loadComments(videoId),
      child: _CollapsedCommentViewContent(videoId: videoId),
    );
  }
}

class _CollapsedCommentViewContent extends StatelessWidget {
  final String videoId;

  const _CollapsedCommentViewContent({super.key, required this.videoId});

  void _openCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentBottomSheet(videoId: videoId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildCollapsedCard(context, null, 0),
          loading: () => _buildCollapsedCard(context, null, 0),
          error: (msg) => _buildCollapsedCard(context, null, 0),
          loaded: (comments, sortType, expandedReplies, isAdding, _) {
            final count = comments.length;
            final topComment = comments.isNotEmpty ? comments.first : null;
            return _buildCollapsedCard(context, topComment, count);
          },
        );
      },
    );
  }

  Widget _buildCollapsedCard(BuildContext context, dynamic comment, int count) {
    return GestureDetector(
      onTap: () => _openCommentSheet(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header Row
            Row(
              children: [
                const Text(
                  'Bình luận',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Theme.of(context).disabledColor,
                ),
              ],
            ),

            if (comment != null) ...[
              const SizedBox(height: 12),
              _buildCommentPreview(context, comment),
            ] else
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: _buildEmptyState(context),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentPreview(BuildContext context, dynamic comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: NetworkImage(comment.avatarUrl),
          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.2),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: '${comment.userName}  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withOpacity(0.9),
                  ),
                ),
                TextSpan(
                  text: comment.content,
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
          child: Icon(
            Icons.person,
            size: 16,
            color: Theme.of(context).disabledColor,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Hãy là người đầu tiên bình luận...',
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).disabledColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

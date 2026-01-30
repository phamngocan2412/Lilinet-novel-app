import 'package:flutter/material.dart';
import '../../domain/entities/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final VoidCallback onLike;
  final VoidCallback onDislike;
  final VoidCallback onReply;
  final VoidCallback onToggleReplies;
  final bool isRepliesExpanded;

  const CommentItem({
    super.key,
    required this.comment,
    required this.onLike,
    required this.onDislike,
    required this.onReply,
    required this.onToggleReplies,
    this.isRepliesExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return _CommentContent(
      comment: comment,
      onLike: onLike,
      onDislike: onDislike,
      onReply: onReply,
      onToggleReplies: onToggleReplies,
      isRepliesExpanded: isRepliesExpanded,
    );
  }
}

class _CommentContent extends StatefulWidget {
  final Comment comment;
  final VoidCallback onLike;
  final VoidCallback onDislike;
  final VoidCallback onReply;
  final VoidCallback onToggleReplies;
  final bool isRepliesExpanded;

  const _CommentContent({
    required this.comment,
    required this.onLike,
    required this.onDislike,
    required this.onReply,
    required this.onToggleReplies,
    required this.isRepliesExpanded,
  });

  @override
  State<_CommentContent> createState() => _CommentContentState();
}

class _CommentContentState extends State<_CommentContent> {
  bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Compact Avatar
          _Avatar(imageUrl: widget.comment.avatarUrl),
          const SizedBox(width: 10),

          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row - Name, Time, Edited
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.comment.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '• ${widget.comment.displayTimeAgo}',
                      style: TextStyle(fontSize: 11, color: theme.hintColor),
                    ),
                    if (widget.comment.isPinned) ...[
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.push_pin,
                        size: 12,
                        color: Color(0xFFC6A664),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 4),

                // Comment Text with expand/collapse
                _CommentText(
                  content: widget.comment.content,
                  showFull: _showFullText,
                  onToggle: () =>
                      setState(() => _showFullText = !_showFullText),
                ),

                const SizedBox(height: 6),

                // Action Buttons Row
                _ActionButtons(
                  likes: widget.comment.likes,
                  repliesCount: widget.comment.repliesCount,
                  onLike: widget.onLike,
                  onReply: widget.onReply,
                  onToggleReplies: widget.comment.repliesCount > 0
                      ? widget.onToggleReplies
                      : null,
                  isRepliesExpanded: widget.isRepliesExpanded,
                ),

                // Replies Section
                if (widget.isRepliesExpanded &&
                    widget.comment.replies.isNotEmpty)
                  _RepliesList(replies: widget.comment.replies),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String imageUrl;

  const _Avatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: 32,
          height: 32,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            Icons.person,
            size: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _CommentText extends StatelessWidget {
  final String content;
  final bool showFull;
  final VoidCallback onToggle;

  const _CommentText({
    required this.content,
    required this.showFull,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Nếu text ngắn, hiển thị full
    if (content.length <= 100) {
      return Text(
        content,
        style: TextStyle(
          fontSize: 13,
          height: 1.3,
          color: theme.textTheme.bodyMedium?.color,
        ),
      );
    }

    // Text dài: có thể thu gọn
    return GestureDetector(
      onTap: onToggle,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 13,
            height: 1.3,
            color: theme.textTheme.bodyMedium?.color,
          ),
          children: [
            TextSpan(
              text: showFull ? content : '${content.substring(0, 100)}... ',
            ),
            TextSpan(
              text: showFull ? ' Thu gọn' : ' Xem thêm',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final int likes;
  final int repliesCount;
  final VoidCallback onLike;
  final VoidCallback onReply;
  final VoidCallback? onToggleReplies;
  final bool isRepliesExpanded;

  const _ActionButtons({
    required this.likes,
    required this.repliesCount,
    required this.onLike,
    required this.onReply,
    this.onToggleReplies,
    required this.isRepliesExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Like Button
        _CompactButton(
          icon: Icons.thumb_up_outlined,
          label: likes > 0 ? likes.toString() : null,
          onTap: onLike,
        ),

        const SizedBox(width: 16),

        // Reply Button
        _CompactButton(
          icon: Icons.chat_bubble_outline,
          label: 'Trả lời',
          onTap: onReply,
        ),

        // Replies Toggle (if has replies)
        if (repliesCount > 0) ...[
          const SizedBox(width: 16),
          GestureDetector(
            onTap: onToggleReplies,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isRepliesExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 2),
                Text(
                  '$repliesCount',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _CompactButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback onTap;

  const _CompactButton({required this.icon, this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: theme.hintColor),
          if (label != null) ...[
            const SizedBox(width: 4),
            Text(
              label!,
              style: TextStyle(fontSize: 12, color: theme.hintColor),
            ),
          ],
        ],
      ),
    );
  }
}

class _RepliesList extends StatelessWidget {
  final List<Comment> replies;

  const _RepliesList({required this.replies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 8),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            width: 2,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: replies.map((reply) {
          return CommentItem(
            comment: reply,
            onLike: () {},
            onDislike: () {},
            onReply: () {},
            onToggleReplies: () {},
          );
        }).toList(),
      ),
    );
  }
}

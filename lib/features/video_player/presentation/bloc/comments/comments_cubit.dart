import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:hive_ce/hive.dart';
import '../../../data/models/comment_model.dart';
import 'comments_state.dart';

@singleton
class CommentsCubit extends Cubit<CommentsState> {
  final Box<Map> _commentsBox;

  CommentsCubit(this._commentsBox) : super(CommentsInitial());

  Future<void> loadComments(String videoId, {bool forceRefresh = false}) async {
    emit(CommentsLoading(videoId));

    try {
      // Fetch from Hive
      final allComments = _getAllComments();
      final videoComments = allComments
          .where((c) => c.movieId == videoId)
          .toList();

      // Sort by newest first
      videoComments.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(CommentsLoaded(videoId, videoComments));
    } catch (e) {
      emit(const CommentsError('Failed to load comments'));
    }
  }

  Future<void> addComment({
    required String videoId,
    required String content,
    required String movieTitle,
    required String movieType,
  }) async {
    final newComment = CommentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userName: 'You',
      content: content,
      createdAt: DateTime.now(),
      likes: 0,
      movieId: videoId,
      movieTitle: movieTitle,
      movieType: movieType,
    );

    // Save to Hive
    await _commentsBox.put(newComment.id, newComment.toJson());
    notifyCommentsUpdated(); // Notify listeners

    // Refresh current list if looking at this video
    loadComments(videoId, forceRefresh: true);
  }

  List<CommentModel> _getAllComments() {
    return _commentsBox.values.map((e) => CommentModel.fromJson(e)).toList();
  }

  // Stream for global updates (e.g. Featured Comments)
  final _updateController = StreamController<void>.broadcast();
  Stream<void> get onCommentsUpdated => _updateController.stream;

  // Used by FeaturedCommentsSection
  List<CommentModel> getFeaturedComments() {
    final all = _getAllComments();
    // Sort by Date Descending (Newest first)
    all.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return all.take(10).toList();
  }

  void notifyCommentsUpdated() {
    _updateController.add(null);
  }

  Future<void> clearAllComments() async {
    await _commentsBox.clear();
    notifyCommentsUpdated();
    // Also emit empty loaded state if we happen to be viewing a video
    if (state is CommentsLoaded) {
      final currentId = (state as CommentsLoaded).videoId; // Was movieId
      emit(CommentsLoaded(currentId, []));
    }
  }

  @override
  Future<void> close() {
    _updateController.close();
    return super.close();
  }
}

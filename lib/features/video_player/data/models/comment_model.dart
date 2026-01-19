class CommentModel {
  final String id;
  final String userName;
  final String? userAvatarUrl;
  final String content;
  final DateTime createdAt;
  final int likes;

  // Context for "Featured" display
  final String movieId;
  final String movieTitle;
  final String movieType;

  CommentModel({
    required this.id,
    required this.userName,
    this.userAvatarUrl,
    required this.content,
    required this.createdAt,
    this.likes = 0,
    required this.movieId,
    required this.movieTitle,
    required this.movieType,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userAvatarUrl': userAvatarUrl,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'likes': likes,
      'movieId': movieId,
      'movieTitle': movieTitle,
      'movieType': movieType,
    };
  }

  factory CommentModel.fromJson(Map<dynamic, dynamic> json) {
    return CommentModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      movieId: json['movieId'] as String? ?? '',
      movieTitle: json['movieTitle'] as String? ?? 'Unknown',
      movieType: json['movieType'] as String? ?? 'TV Series',
    );
  }
}

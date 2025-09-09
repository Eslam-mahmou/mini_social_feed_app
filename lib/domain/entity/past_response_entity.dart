class PostResponseEntity {
  final String postId;
  final String userId;
  final String title;
  final String description;
  final String? imageUrl;
  final List<String> likes;
  final DateTime createdAt;

  const PostResponseEntity({
    required this.postId,
    required this.userId,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.likes,
    required this.createdAt,
  });
}

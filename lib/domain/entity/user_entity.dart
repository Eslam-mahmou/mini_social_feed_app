class UserEntity{
  final String uid;
  final String username;
  final String email;
  final String? photoUrl;

  const UserEntity({
    required this.uid,
    required this.username,
    required this.email,
    this.photoUrl,
  });
}
class UserEntity {
  final String username;
  final String? email; // Tambahkan field sesuai kebutuhan
  final String token; // Jika perlu

  UserEntity({
    required this.username,
    this.email,
    required this.token,
  });
}
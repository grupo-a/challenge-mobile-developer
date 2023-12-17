abstract class LoginEntity {
  final String? email;
  final String? password;
  final int? id;
  final String? token;
  final DateTime? createdAt;

  LoginEntity({
    this.email,
    this.password,
    this.id,
    this.token,
    this.createdAt,
  });
}

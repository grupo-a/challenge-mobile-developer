class LoginResponse {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String refreshToken;
  final String userType;

  LoginResponse(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn,
      required this.refreshToken,
      required this.userType});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in'],
        refreshToken: json['refresh_token'],
        userType: json['user_type'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['refresh_token'] = refreshToken;
    data['user_type'] = userType;
    return data;
  }
}

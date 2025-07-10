// Model untuk Request (data yang dikirim ke API)
class RegisterRequest {
  final String email;
  final String username;
  final String password;

  RegisterRequest({
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'username': username,
    'password': password,
  };
}

// Model untuk Response (data yang diterima dari API)
class RegisterResponse {
  final String message;

  RegisterResponse({
    required this.message
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String,
    );
  }
}


class LoginRequest {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}

// Model untuk Response (data yang diterima dari API)
class LoginResponse {
  final String token;
  final String username;

  LoginResponse({
    required this.token,
    required this.username
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String,
      username: json['username'] as String
    );
  }
}
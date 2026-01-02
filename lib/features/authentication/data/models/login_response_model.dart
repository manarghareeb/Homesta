class LoginResponseModel {
  final String token;
  final UserModel user;

  LoginResponseModel({
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] ?? '',
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final List<String> roles; // هنا بتخزن الأدوار

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
    );
  }

  bool get isAdmin => roles.contains("Admin");

  bool get isSeller => roles.contains("Seller");

  bool get isUser => roles.contains("User");
}

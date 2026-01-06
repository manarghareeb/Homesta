class ChangePasswordResponseModel {
  final String message;

  ChangePasswordResponseModel({
    required this.message,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ChangePasswordResponseModel(message: "No response");
    }
    return ChangePasswordResponseModel(
      message: json['message'] ?? '',
    );
  }
}

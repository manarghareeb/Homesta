class VerifyResetCodeResponseModel {
  final String message;

  VerifyResetCodeResponseModel({required this.message});

  factory VerifyResetCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyResetCodeResponseModel(message: json['message'] ?? '');
  }
}

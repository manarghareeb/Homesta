class ResendResetCodeResponseModel {
  final String message;

  ResendResetCodeResponseModel({required this.message});

  factory ResendResetCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return ResendResetCodeResponseModel(message: json['message'] ?? '');
  }
}

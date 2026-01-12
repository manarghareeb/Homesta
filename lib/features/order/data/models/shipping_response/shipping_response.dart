/*import 'info.dart';

class ShippingResponse {
  String? userId;
  Info? info;

  ShippingResponse({this.userId, this.info});

  factory ShippingResponse.fromJson(Map<String, dynamic> json) {
    return ShippingResponse(
      userId: json['userId'] as String?,
      info:
          json['info'] == null
              ? null
              : Info.fromJson(json['info'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'userId': userId, 'info': info?.toJson()};
}
*/
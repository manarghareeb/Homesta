import 'cart_item.dart';

class CartModel {
  int? cartId;
  String? userId;
  List<CartItem>? cartItems;
  int? totalItems;
  double? subTotal;
  int? shipping;
  int? tax;
  double? totalPrice;
  DateTime? createdAt;
  bool? isEmpty;

  CartModel({
    this.cartId,
    this.userId,
    this.cartItems,
    this.totalItems,
    this.subTotal,
    this.shipping,
    this.tax,
    this.totalPrice,
    this.createdAt,
    this.isEmpty,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    cartId: json['cartId'] as int?,
    userId: json['userId'] as String?,
    cartItems:
        (json['cartItems'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
    totalItems: json['totalItems'] as int?,
    subTotal: json['subTotal'] as double?,
    shipping: json['shipping'] as int?,
    tax: json['tax'] as int?,
    totalPrice: json['totalPrice'] as double?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
    isEmpty: json['isEmpty'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'cartId': cartId,
    'userId': userId,
    'cartItems': cartItems?.map((e) => e.toJson()).toList(),
    'totalItems': totalItems,
    'subTotal': subTotal,
    'shipping': shipping,
    'tax': tax,
    'totalPrice': totalPrice,
    'createdAt': createdAt?.toIso8601String(),
    'isEmpty': isEmpty,
  };
}

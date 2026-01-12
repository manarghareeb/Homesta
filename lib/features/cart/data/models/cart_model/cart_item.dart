class CartItem {
  int? cartItemId;
  int? productId;
  String? productName;
  List<String>? productColors;
  double? unitPrice;
  int? quantity;
  double? totalPrice;
  String? categoryName;
  int? productDiscount;
  double? finalPrice;

  CartItem({
    this.cartItemId,
    this.productId,
    this.productName,
    this.productColors,
    this.unitPrice,
    this.quantity,
    this.totalPrice,
    this.categoryName,
    this.productDiscount,
    this.finalPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    cartItemId: json['cartItemId'] as int?,
    productId: json['productId'] as int?,
    productName: json['productName'] as String?,
    productColors: json['productColors'] as List<String>?,
    unitPrice: json['unitPrice'] as double?,
    quantity: json['quantity'] as int?,
    totalPrice: json['totalPrice'] as double?,
    categoryName: json['categoryName'] as String?,
    productDiscount: json['productDiscount'] as int?,
    finalPrice: json['finalPrice'] as double?,
  );

  Map<String, dynamic> toJson() => {
    'cartItemId': cartItemId,
    'productId': productId,
    'productName': productName,
    'productColors': productColors,
    'unitPrice': unitPrice,
    'quantity': quantity,
    'totalPrice': totalPrice,
    'categoryName': categoryName,
    'productDiscount': productDiscount,
    'finalPrice': finalPrice,
  };
}

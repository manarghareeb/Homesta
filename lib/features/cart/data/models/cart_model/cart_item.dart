class CartItem {
  int? cartItemId;
  int? productId;
  String? productName;
  int? colorId;
  String? productColor;
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
    this.colorId,
    this.productColor,
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
    colorId: json['colorId'] as int?,
    productColor: json['colorName'] as String?,
    unitPrice:
        (json['unitPrice'] != null)
            ? (json['unitPrice'] as num).toDouble()
            : null,
    quantity: json['quantity'] as int?,
    totalPrice:
        (json['totalPrice'] != null)
            ? (json['totalPrice'] as num).toDouble()
            : null,
    categoryName: json['categoryName'] as String?,
    productDiscount: json['productDiscount'] as int?,
    finalPrice:
        (json['finalPrice'] != null)
            ? (json['finalPrice'] as num).toDouble()
            : null,
  );

  Map<String, dynamic> toJson() => {
    'cartItemId': cartItemId,
    'productId': productId,
    'productName': productName,
    'colorId': colorId,
    'colorName': productColor,
    'unitPrice': unitPrice,
    'quantity': quantity,
    'totalPrice': totalPrice,
    'categoryName': categoryName,
    'productDiscount': productDiscount,
    'finalPrice': finalPrice,
  };
}

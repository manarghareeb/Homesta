class CartItem {
  int? cartItemId;
  int? productId;
  String? productName;
  List<String>? productColors;
  int? unitPrice;
  int? quantity;
  int? totalPrice;
  String? categoryName;
  int? productDiscount;
  int? finalPrice;

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
    unitPrice: json['unitPrice'] as int?,
    quantity: json['quantity'] as int?,
    totalPrice: json['totalPrice'] as int?,
    categoryName: json['categoryName'] as String?,
    productDiscount: json['productDiscount'] as int?,
    finalPrice: json['finalPrice'] as int?,
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

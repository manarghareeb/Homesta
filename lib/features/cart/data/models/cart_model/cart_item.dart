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
        productColors: (json['productColors'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        unitPrice: (json['unitPrice'] != null)
            ? (json['unitPrice'] as num).toDouble()
            : null,
        quantity: json['quantity'] as int?,
        totalPrice: (json['totalPrice'] != null)
            ? (json['totalPrice'] as num).toDouble()
            : null,
        categoryName: json['categoryName'] as String?,
        productDiscount: json['productDiscount'] as int?,
        finalPrice: (json['finalPrice'] != null)
            ? (json['finalPrice'] as num).toDouble()
            : null,
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


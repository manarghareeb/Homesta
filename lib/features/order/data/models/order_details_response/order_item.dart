class OrderItem {
  final int orderItemId;
  final String productName;
  final String productColor;
  final double finalUnitPrice;
  final int quantity;
  final double originalUnitPrice;
  final double discountPercentage;
  final double discountAmountPerUnit;
  final double subtotal;
  final double totalDiscount;
  final double total;
  final int productId;

  OrderItem({
    required this.orderItemId,
    required this.productName,
    required this.productColor,
    required this.finalUnitPrice,
    required this.quantity,
    required this.originalUnitPrice,
    required this.discountPercentage,
    required this.discountAmountPerUnit,
    required this.subtotal,
    required this.totalDiscount,
    required this.total,
    required this.productId,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      orderItemId: json['orderItemId'],
      productName: json['productName'],
      productColor: json['productColor'],
      finalUnitPrice: (json['finalUnitPrice'] as num).toDouble(),
      quantity: json['quantity'],
      originalUnitPrice: (json['originalUnitPrice'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountAmountPerUnit: (json['discountAmountPerUnit'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      totalDiscount: (json['totalDiscount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      productId: json['productId'],
    );
  }
}

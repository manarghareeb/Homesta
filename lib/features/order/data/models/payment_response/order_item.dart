class OrderItem {
  final int orderItemId;
  final int quantity;
  final double originalUnitPrice;
  final double discountPercentage;
  final double discountAmountPerUnit;
  final double finalUnitPrice;
  final double subtotal;
  final double totalDiscount;
  final double total;
  final String productName;
  final int productId;
  final String productColor;

  OrderItem({
    required this.orderItemId,
    required this.quantity,
    required this.originalUnitPrice,
    required this.discountPercentage,
    required this.discountAmountPerUnit,
    required this.finalUnitPrice,
    required this.subtotal,
    required this.totalDiscount,
    required this.total,
    required this.productName,
    required this.productId,
    required this.productColor,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        orderItemId: json['orderItemId'] as int,
        quantity: json['quantity'] as int,
        originalUnitPrice: (json['originalUnitPrice'] as num).toDouble(),
        discountPercentage: (json['discountPercentage'] as num).toDouble(),
        discountAmountPerUnit: (json['discountAmountPerUnit'] as num).toDouble(),
        finalUnitPrice: (json['finalUnitPrice'] as num).toDouble(),
        subtotal: (json['subtotal'] as num).toDouble(),
        totalDiscount: (json['totalDiscount'] as num).toDouble(),
        total: (json['total'] as num).toDouble(),
        productName: json['productName'] as String,
        productId: json['productId'] as int,
        productColor: json['productColor'] as String,
      );
}
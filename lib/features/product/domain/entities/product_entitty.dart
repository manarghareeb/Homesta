class ProductEntity {
  final String name;
  final String description;
  final List<dynamic> colors;
  final double price;
  final int rating;
  final int quantity;
  final int discount;
  final int deliveryTime;
  final int subCategoryId;
  final int categoryId;
  final int storeId;

  const ProductEntity({
    required this.name,
    required this.description,
    required this.colors,
    required this.price,
    required this.rating,
    required this.quantity,
    required this.discount,
    required this.deliveryTime,
    required this.subCategoryId,
    required this.categoryId,
    required this.storeId,
  });
}

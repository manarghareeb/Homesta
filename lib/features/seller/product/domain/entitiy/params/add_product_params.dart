class AddProductParams {

  final String name;
  final String description;
  final List<String> colors;
  final double price;
  final int quantity;
  final double discount;
  final int subCategoryId;
  final int categoryId;
  final int storeId;

  AddProductParams({

    required this.name,
    required this.description,
    required this.colors,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.subCategoryId,
    required this.categoryId,
    required this.storeId,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "colors": colors,
      "price": price,
      "quantity": quantity,
      "discount": discount,
      "subCategoryId": subCategoryId,
      "categoryId": categoryId,
      "storeId": storeId,
    };
  }
}

class SubCategoryEntity {
  final int subCategoryId;
  final int categoryId;
  final String name;
  final String imagePath;

  const SubCategoryEntity({
    required this.subCategoryId,
    required this.categoryId,
    required this.name,
    required this.imagePath,
  });
}

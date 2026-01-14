import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';

class SearchSubCategoryUseCase {
List<SubCategoryEntity>  call(List<SubCategoryEntity> all, String query) {
    return all
        .where((sub) => sub.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

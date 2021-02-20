import 'package:apiboss/model/chucksCategories.dart';
import 'package:apiboss/networking/ApiProvider.dart';

class ChuckCategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckCategories> fetchChuckCategoryData() async {
    final response = await _provider.get("jokes/categories");
    return chuckCategories.fromJson(response);
  }
}
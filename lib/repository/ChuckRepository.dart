import 'package:apiboss/model/response.dart';
import 'package:apiboss/networking/ApiProvider.dart';

class ChuckRepository {
  ApiProvider _provider = ApiProvider();

  Future<chukResponse> fetchChuckJoke(String category) async {
    final response = await _provider.get("jokes/random?category=" + category);
    return chukResponse.fromJson(response);
  }
}
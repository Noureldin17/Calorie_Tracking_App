import 'package:dio/dio.dart';
import '../../constants/api_constants.dart';

class RecipesWebService {
  late Dio dio;

  RecipesWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 20000),
      receiveTimeout: Duration(milliseconds: 20000),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getRecipes(
      List<String> diet, List<String> health) async {
    try {
      Response response = await dio.get(
        'recipes/v2',
        queryParameters: {
          'random': random,
          'type': type,
          'app_key': app_key,
          'app_id': app_id,
          'health': health,
          'diet': diet,
          'imageSize': imageSize
        },
      );

      return response.data["hits"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

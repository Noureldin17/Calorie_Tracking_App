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

  Future<List<dynamic>> getRecipes() async {
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

      print(response.data["hits"].toString());
      print(response.statusCode);
      print(response.requestOptions.followRedirects.toString());
      print(response.requestOptions.extra.toString());
      print(response.requestOptions.queryParameters.toString());
      print("LOADED");
      return response.data["hits"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

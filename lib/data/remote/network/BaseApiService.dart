abstract class BaseApiService {

  final String baseUrl = "https://dummyjson.com/";

  Future<dynamic> getResponse(String url);

}
import 'package:blog_mobile/Services/Webservice/Model/Posts/posts.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiManager {
  factory ApiManager(Dio dio, {String? baseUrl}){
    dio.options = BaseOptions(
      receiveTimeout: 30000, // 30000ms = 30s
      connectTimeout: 30000, // 30000ms = 30s
      contentType: 'application/json',
      headers: {
        'Accept': 'application/json',
        'Cache-Control': 'no-cache, no-store, must-revalidate'
        // 'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
        // 'X-ApiKey': 'ZGslzIzEyMw==',
        // 'Content-Type': 'application/json'
      }
    );

    return _ApiManager(dio, baseUrl:baseUrl);
  }
  
  @GET('posts')
  Future<List<Posts>> getPosts();
}
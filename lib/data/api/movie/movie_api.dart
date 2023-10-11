import 'package:clean_architecture_flutter/data/api/api_interceptor.dart';
import 'package:clean_architecture_flutter/data/api/movie/category_movie_response.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MovieApi {
  const MovieApi({
    required this.apiInterceptor,
    required this.logInterceptor,
    required this.dio,
  });

  final ApiInterceptor apiInterceptor;
  final PrettyDioLogger logInterceptor;
  final Dio dio;

  void addInterceptor() {
    dio.interceptors.add(apiInterceptor);
    dio.interceptors.add(logInterceptor);
  }

  Future<CategoryMoviePageResponse> getCategoryMovies({
    required int page,
    required String category,
  }) async {
    final response =
        await dio.get("movie/$category", queryParameters: {"page": page});
    return CategoryMoviePageResponse.fromJson(response.data);
  }
}

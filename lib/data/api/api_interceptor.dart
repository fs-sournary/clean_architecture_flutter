import 'package:clean_architecture_flutter/data/storage/storage_data_source.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  const ApiInterceptor({required this.storageDataSource});

  final StorageDataSource storageDataSource;

  static const _apiKeyParameter = "api_key";
  static const _apiKey = "d107661962965284a68ab916fb8bd204";

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await storageDataSource.getAccessToken();
    if (accessToken.isNotEmpty) {
      options.headers["Authorization"] = accessToken;
    }
    options.queryParameters[_apiKeyParameter] = _apiKey;
    super.onRequest(options, handler);
  }
}

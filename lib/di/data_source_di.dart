import 'package:clean_architecture_flutter/data/api/api_interceptor.dart';
import 'package:clean_architecture_flutter/data/api/movie/movie_api.dart';
import 'package:clean_architecture_flutter/data/storage/storage_data_source.dart';
import 'package:clean_architecture_flutter/di/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void registerDataSources() {
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => StorageDataSource(storage: getIt()));
  getIt.registerLazySingleton(() => ApiInterceptor(storageDataSource: getIt()));
  getIt.registerLazySingleton(() => PrettyDioLogger());
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org/3/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    ),
  );
  getIt.registerLazySingleton<MovieApi>(
    () {
      final client = MovieApi(
        apiInterceptor: getIt(),
        logInterceptor: getIt(),
        dio: getIt(),
      );
      client.addInterceptor();
      return client;
    },
  );
}

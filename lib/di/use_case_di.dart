import 'package:clean_architecture_flutter/di/get_it.dart';
import 'package:clean_architecture_flutter/usecase/setting/load_theme_use_case.dart';
import 'package:clean_architecture_flutter/usecase/setting/save_theme_use_case.dart';

void registerUseCases() {
  getIt.registerFactory(() => LoadThemeUseCase(storageDataSource: getIt()));
  getIt.registerFactory(() => SaveThemeUseCase(storageDataSource: getIt()));
}

import 'package:clean_architecture_flutter/di/get_it.dart';
import 'package:clean_architecture_flutter/page/theme/theme_bloc.dart';


void registerBlocs() {
  getIt.registerFactory(
    () => ThemeBloc(
      loadThemeUseCase: getIt(),
      saveThemeUseCase: getIt(),
    ),
  );
}

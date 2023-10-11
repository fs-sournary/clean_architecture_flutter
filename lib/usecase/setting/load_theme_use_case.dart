import 'package:clean_architecture_flutter/data/storage/storage_data_source.dart';
import 'package:clean_architecture_flutter/usecase/async_use_case.dart';
import 'package:flutter/material.dart';

class LoadThemeUseCase extends AsyncUseCase<void, ThemeMode> {
  const LoadThemeUseCase({required this.storageDataSource});

  final StorageDataSource storageDataSource;

  @override
  Future<ThemeMode> call(void params) {
    return storageDataSource.getTheme();
  }
}

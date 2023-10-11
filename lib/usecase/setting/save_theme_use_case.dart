import 'package:clean_architecture_flutter/data/storage/storage_data_source.dart';
import 'package:clean_architecture_flutter/usecase/async_use_case.dart';
import 'package:flutter/material.dart';

class SaveThemeUseCase extends AsyncUseCase<ThemeMode, void> {
  const SaveThemeUseCase({required this.storageDataSource});

  final StorageDataSource storageDataSource;

  @override
  Future<void> call(ThemeMode params) {
    return storageDataSource.saveTheme(params);
  }
}

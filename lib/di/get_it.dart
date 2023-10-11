import 'package:clean_architecture_flutter/di/bloc_di.dart';
import 'package:clean_architecture_flutter/di/data_source_di.dart';
import 'package:clean_architecture_flutter/di/use_case_di.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  registerDataSources();
  registerUseCases();
  registerBlocs();
}

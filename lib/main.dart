import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter/app.dart';
import 'package:clean_architecture_flutter/clf_bloc_observer.dart';
import 'package:clean_architecture_flutter/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge).then(
    (value) {
      Bloc.observer = ClfBlocObserver();
      registerDependencies();
      runApp(const App());
    },
  );
}

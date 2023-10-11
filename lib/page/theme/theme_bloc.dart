import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter/usecase/setting/load_theme_use_case.dart';
import 'package:clean_architecture_flutter/usecase/setting/save_theme_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required this.loadThemeUseCase,
    required this.saveThemeUseCase,
  }) : super(const ThemeState()) {
    on<ThemeLoaded>(_onThemeLoaded);
    on<ThemeSaved>(_onThemeSaved);
  }

  final LoadThemeUseCase loadThemeUseCase;
  final SaveThemeUseCase saveThemeUseCase;

  Future<void> _onThemeLoaded(
    ThemeLoaded event,
    Emitter<ThemeState> emit,
  ) async {
    final themeMode = await loadThemeUseCase.call(null);
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> _onThemeSaved(
    ThemeSaved event,
    Emitter<ThemeState> emit,
  ) async {
    final themeMode = event.themeMode;
    await saveThemeUseCase.call(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }
}

part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeLoaded extends ThemeEvent {
  const ThemeLoaded();

  @override
  List<Object> get props => [];
}

class ThemeSaved extends ThemeEvent {
  const ThemeSaved(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object> get props => [];
}

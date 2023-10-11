import 'package:flutter/material.dart';
import 'package:material_color_utilities/blend/blend.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required super.child,
    required this.setting,
    required this.lightColorScheme,
    required this.darkColorScheme,
  });

  final ThemeSetting setting;
  final ColorScheme? lightColorScheme;
  final ColorScheme? darkColorScheme;

  Color _blend(Color targetColor) {
    final blendColor =
        Blend.harmonize(targetColor.value, setting.sourceColor.value);
    return Color(blendColor);
  }

  Color _source(Color? targetColor) {
    Color sourceColor = setting.sourceColor;
    if (targetColor != null) {
      sourceColor = _blend(targetColor);
    }
    return sourceColor;
  }

  ColorScheme _colorScheme(Brightness brightness, Color? targetColor) {
    final colorSchemePrimary = brightness == Brightness.light
        ? lightColorScheme?.primary
        : darkColorScheme?.primary;
    return ColorScheme.fromSeed(
      seedColor: colorSchemePrimary ?? _source(targetColor),
      brightness: brightness,
    );
  }

  AppBarTheme _appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
    );
  }

  CardTheme _cardTheme() {
    return const CardTheme(elevation: 0, clipBehavior: Clip.antiAlias);
  }

  NavigationRailThemeData _navigationRailTheme() {
    return const NavigationRailThemeData();
  }

  NavigationBarThemeData _navigationBarTheme() {
    return const NavigationBarThemeData();
  }

  ThemeData light(Color? targetColor) {
    final colorScheme = _colorScheme(Brightness.light, targetColor);
    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardTheme(),
      navigationRailTheme: _navigationRailTheme(),
      navigationBarTheme: _navigationBarTheme(),
      scaffoldBackgroundColor: colorScheme.surface,
      useMaterial3: true,
    );
  }

  ThemeData dark(Color? targetColor) {
    final colorScheme = _colorScheme(Brightness.dark, targetColor);
    return ThemeData.dark().copyWith(
      colorScheme: colorScheme,
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardTheme(),
      navigationRailTheme: _navigationRailTheme(),
      navigationBarTheme: _navigationBarTheme(),
      scaffoldBackgroundColor: colorScheme.surface,
      useMaterial3: true,
    );
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.setting != setting;
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }
}

class ThemeSetting {
  const ThemeSetting({required this.sourceColor, required this.themeMode});

  final Color sourceColor;
  final ThemeMode themeMode;
}

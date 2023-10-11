import 'package:clean_architecture_flutter/page/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final icon = isDark ? Icons.brightness_7 : Icons.brightness_2;
    return IconButton(
      onPressed: () {
        final newThemeMode = isDark ? ThemeMode.light : ThemeMode.dark;
        context.read<ThemeBloc>().add(ThemeSaved(newThemeMode));
      },
      icon: Icon(icon),
    );
  }
}

import 'package:clean_architecture_flutter/di/get_it.dart';
import 'package:clean_architecture_flutter/generated/l10n.dart';

import 'package:clean_architecture_flutter/page/home/home_page.dart';
import 'package:clean_architecture_flutter/page/theme/theme_bloc.dart';
import 'package:clean_architecture_flutter/widget/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const _sourceColor = Color(0xFF6750A4);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => getIt<ThemeBloc>()..add(const ThemeLoaded()),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        buildWhen: (previous, current) {
          return previous.themeMode != current.themeMode;
        },
        builder: (context, state) {
          return Builder(
            builder: (context) {
              final themeSetting = ThemeSetting(
                sourceColor: _sourceColor,
                themeMode: state.themeMode,
              );
              return ThemeProvider(
                setting: themeSetting,
                lightColorScheme: null,
                darkColorScheme: null,
                child: Builder(
                  builder: (context) {
                    final themeProvider = ThemeProvider.of(context);
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: "Clean architecture flutter",
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      theme: themeProvider.light(themeSetting.sourceColor),
                      darkTheme: themeProvider.dark(themeSetting.sourceColor),
                      themeMode: themeSetting.themeMode,
                      home: const HomePage(),
                    );
                  }
                ),
              );
            },
          );
        },
      ),
    );
  }
}

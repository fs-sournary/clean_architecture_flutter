import 'package:clean_architecture_flutter/generated/l10n.dart';
import 'package:clean_architecture_flutter/widget/theme_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.home_title),
        actions: const [
          ThemeButton(),
        ],
      ),
    );
  }
}

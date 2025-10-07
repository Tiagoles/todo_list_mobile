import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:smaservicos/app/ui/core/viewmodels/theme_viewmodel.dart';
import 'package:smaservicos/app/ui/themes/app_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _noScreenshot = NoScreenshot.instance;

  @override
  void initState() {
    super.initState();
    // disableScreenshot();
  }

  void disableScreenshot() async {
    await _noScreenshot.screenshotOff();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppTheme();
    return ValueListenableBuilder(
      valueListenable: Modular.get<ThemeViewmodel>(),
      builder: (_, value, child){
        return MaterialApp.router(
          title: 'SMA Inspeção',
          themeMode: value,
          theme: theme.light(context),
          darkTheme: theme.dark(context),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate
        );
      }
    );

  }
}
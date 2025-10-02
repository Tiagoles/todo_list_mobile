import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/themes/app_theme.dart';

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  ThemeMode get themeMode => MediaQuery.of(this).platformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;
  ColorScheme get colors => Theme.of(this).colorScheme;
  CustomThemeExtension get customTheme => Theme.of(this).extension<CustomThemeExtension>()!;
  CustomColors get customColors => customTheme.resolveWithContext(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  BoxShadow shadowSm({Color? color,Offset offset = const Offset(0, 0)}) => BoxShadow(
    color: color ?? Colors.black.withAlpha(20),
    blurRadius: 4,
    offset: offset,
  );
  BoxShadow shadow({Color? color,Offset offset = const Offset(0, 4)}) => BoxShadow(
    color: color ?? Colors.black.withAlpha(50),
    blurRadius: 8,
    offset: offset,
  );
  BoxShadow shadowLg({Color? color,Offset offset = const Offset(0, 8)}) => BoxShadow(
    color: color ?? Colors.black.withAlpha(90),
    blurRadius: 16,
    offset: offset,
  );
}
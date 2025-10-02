part of 'app_theme.dart';

ElevatedButtonThemeData _getElevatedButtonTheme(ColorScheme scheme){
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: scheme.surface, fontFamily: 'Square721', fontWeight: FontWeight.normal, fontSize: 14.0),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.2)),
          ),
          backgroundColor: scheme.primary
      )
  );
}

InputDecorationTheme _getInputDecorationTheme(ColorScheme scheme){
  return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLowest,
      iconColor: scheme.outline,
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1,
              color: scheme.outlineVariant
          )
      ),
      labelStyle: TextStyle(color: scheme.outline, fontFamily: 'Sq'
          'uare721', fontWeight: FontWeight.normal, fontSize: 4),
      hintStyle: TextStyle(
        color: scheme.outline,
      ),
      contentPadding: const EdgeInsets.fromLTRB(12,6,12,6)
  );
}

TextTheme _getTextTheme(ColorScheme scheme){
  return TextTheme(
    bodySmall: TextStyle(color: scheme.onSurface, fontFamily: 'Square721', fontWeight: FontWeight.normal, fontSize: 12.0),
    bodyMedium: TextStyle(color: scheme.onSurface, fontFamily: 'Square721', fontWeight: FontWeight.normal, fontSize: 14.0),
    bodyLarge: TextStyle(color: scheme.onSurface, fontFamily: 'Square721', fontWeight: FontWeight.normal, fontSize: 16.0),
    titleSmall: TextStyle(color: scheme.primary, fontFamily: 'Square721', fontWeight: FontWeight.bold, fontSize: 14.0),
    titleMedium: TextStyle(color: scheme.primary, fontFamily: 'Square721', fontWeight: FontWeight.bold, fontSize: 16.0),
    titleLarge: TextStyle(color: scheme.primary, fontFamily: 'Square721', fontWeight: FontWeight.bold, fontSize: 20.0),
    headlineSmall: TextStyle(color: scheme.primary, fontFamily: 'Square721', fontWeight: FontWeight.bold, fontSize: 24.0),
    headlineMedium: TextStyle(color: scheme.primary, fontFamily: 'Square721', fontWeight: FontWeight.bold, fontSize: 28.0),
    headlineLarge: TextStyle(color: scheme.primary, fontFamily: 'Square721', fontWeight: FontWeight.bold, fontSize: 32.0),
    labelSmall: TextStyle(color: scheme.onSurface, fontFamily: 'Square721',
        fontWeight: FontWeight.normal, fontSize: 10.0),
    labelMedium: TextStyle(color: scheme.onSurface, fontFamily: 'Square721',
        fontWeight: FontWeight.normal, fontSize: 12.0),
    labelLarge: TextStyle(color: scheme.onSurface, fontFamily: 'Square721',
        fontWeight: FontWeight.normal, fontSize: 14.0),
    displaySmall: TextStyle(color: scheme.onSurface, fontFamily: 'Square721', fontWeight: FontWeight.normal, fontSize: 40.0),
    displayMedium: TextStyle(color: scheme.onSurface, fontFamily: 'Square721', fontWeight: FontWeight.normal, fontSize: 48.0),
    displayLarge: TextStyle(color: scheme.onSurface, fontFamily: 'Square721', fontWeight: FontWeight.normal, fontSize: 56.0),
  );
}

RadioThemeData _getRadioTheme(ColorScheme scheme){
  return RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return scheme.primaryContainer;
      return scheme.outline;
    }),
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
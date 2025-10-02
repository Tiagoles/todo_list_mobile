part of 'app_theme.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final ExtendedColor success;
  final ExtendedColor info;
  final ExtendedColor neutralDark;

  CustomThemeExtension({
    required this.success,
    required this.info,
    required this.neutralDark,
  });

  @override
  CustomThemeExtension copyWith({
    ExtendedColor? success,
    ExtendedColor? info,
    ExtendedColor? neutralDark,
  }) {
    return CustomThemeExtension(
      success: success ?? this.success,
      info: info ?? this.info,
      neutralDark: neutralDark ?? this.neutralDark,
    );
  }

  CustomColors _resolveColors(Brightness brightness) => (
    success: success.resolve(brightness),
    info: info.resolve(brightness),
    neutralDark: neutralDark.resolve(brightness),
  );

  CustomColors resolveWithContext(BuildContext context) =>
      _resolveColors(Theme.of(context).brightness);

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      success: other.success,
      info: other.info,
      neutralDark: other.neutralDark,
    );
  }
}

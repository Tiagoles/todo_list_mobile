part of 'app_theme.dart';

/// Success
const success = ExtendedColor(
  seed: Color(0xff27c24c),
  value: Color(0xff27c24c),
  light: ColorFamily(
    color: Color(0xff006e23),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff27c24c),
    onColorContainer: Color(0xff004914),
  ),
  lightMediumContrast: ColorFamily(
    color: Color(0xff006e23),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff27c24c),
    onColorContainer: Color(0xff004914),
  ),
  lightHighContrast: ColorFamily(
    color: Color(0xff006e23),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff27c24c),
    onColorContainer: Color(0xff004914),
  ),
  dark: ColorFamily(
    color: Color(0xff50e167),
    onColor: Color(0xff00390e),
    colorContainer: Color(0xff27c24c),
    onColorContainer: Color(0xff004914),
  ),
  darkMediumContrast: ColorFamily(
    color: Color(0xff50e167),
    onColor: Color(0xff00390e),
    colorContainer: Color(0xff27c24c),
    onColorContainer: Color(0xff004914),
  ),
  darkHighContrast: ColorFamily(
    color: Color(0xff50e167),
    onColor: Color(0xff00390e),
    colorContainer: Color(0xff27c24c),
    onColorContainer: Color(0xff004914),
  ),
);

/// Info
const info = ExtendedColor(
  seed: Color(0xff23b7e5),
  value: Color(0xff23b7e5),
  light: ColorFamily(
    color: Color(0xff006783),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff23b7e5),
    onColorContainer: Color(0xff004458),
  ),
  lightMediumContrast: ColorFamily(
    color: Color(0xff006783),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff23b7e5),
    onColorContainer: Color(0xff004458),
  ),
  lightHighContrast: ColorFamily(
    color: Color(0xff006783),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff23b7e5),
    onColorContainer: Color(0xff004458),
  ),
  dark: ColorFamily(
    color: Color(0xff62d4ff),
    onColor: Color(0xff003545),
    colorContainer: Color(0xff23b7e5),
    onColorContainer: Color(0xff004458),
  ),
  darkMediumContrast: ColorFamily(
    color: Color(0xff62d4ff),
    onColor: Color(0xff003545),
    colorContainer: Color(0xff23b7e5),
    onColorContainer: Color(0xff004458),
  ),
  darkHighContrast: ColorFamily(
    color: Color(0xff62d4ff),
    onColor: Color(0xff003545),
    colorContainer: Color(0xff23b7e5),
    onColorContainer: Color(0xff004458),
  ),
);

/// Neutral Dark
const neutralDark = ExtendedColor(
  seed: Color(0xff3a3f51),
  value: Color(0xff3a3f51),
  light: ColorFamily(
    color: Color(0xff24293a),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff3a3f51),
    onColorContainer: Color(0xffa6aac0),
  ),
  lightMediumContrast: ColorFamily(
    color: Color(0xff24293a),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff3a3f51),
    onColorContainer: Color(0xffa6aac0),
  ),
  lightHighContrast: ColorFamily(
    color: Color(0xff24293a),
    onColor: Color(0xffffffff),
    colorContainer: Color(0xff3a3f51),
    onColorContainer: Color(0xffa6aac0),
  ),
  dark: ColorFamily(
    color: Color(0xffc1c5dc),
    onColor: Color(0xff2b3041),
    colorContainer: Color(0xff3a3f51),
    onColorContainer: Color(0xffa6aac0),
  ),
  darkMediumContrast: ColorFamily(
    color: Color(0xffc1c5dc),
    onColor: Color(0xff2b3041),
    colorContainer: Color(0xff3a3f51),
    onColorContainer: Color(0xffa6aac0),
  ),
  darkHighContrast: ColorFamily(
    color: Color(0xffc1c5dc),
    onColor: Color(0xff2b3041),
    colorContainer: Color(0xff3a3f51),
    onColorContainer: Color(0xffa6aac0),
  ),
);

typedef CustomColors = ({
  ColorFamily success,
  ColorFamily info,
  ColorFamily neutralDark,
});

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });

  ColorFamily resolve(Brightness brightness) => brightness == Brightness.dark ? dark : light;

}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
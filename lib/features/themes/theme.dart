import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00696f),
      surfaceTint: Color(0xff00696f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color.fromARGB(255, 19, 37, 97),
      onPrimaryContainer: Color(0xff006b71),
      secondary: Color(0xff29676b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffaeeaef),
      onSecondaryContainer: Color(0xff2e6b70),
      tertiary: Color(0xff5d5b7c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdcd8ff),
      onTertiaryContainer: Color(0xff5f5d7e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff3fbfb),
      onSurface: Color(0xff151d1e),
      onSurfaceVariant: Color(0xff3a494b),
      outline: Color(0xff6a7a7b),
      outlineVariant: Color(0xffb9cacb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a3232),
      inversePrimary: Color(0xff00dce6),
      primaryFixed: Color(0xff6ff6ff),
      onPrimaryFixed: Color(0xff002022),
      primaryFixedDim: Color(0xff00dce6),
      onPrimaryFixedVariant: Color(0xff004f53),
      secondaryFixed: Color(0xffb1edf2),
      onSecondaryFixed: Color(0xff002022),
      secondaryFixedDim: Color(0xff95d1d5),
      onSecondaryFixedVariant: Color(0xff054f53),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff1a1835),
      tertiaryFixedDim: Color(0xffc6c2e9),
      onTertiaryFixedVariant: Color(0xff454363),
      surfaceDim: Color(0xffd3dcdc),
      surfaceBright: Color(0xfff3fbfb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf5f5),
      surfaceContainer: Color(0xffe7eff0),
      surfaceContainerHigh: Color(0xffe1eaea),
      surfaceContainerHighest: Color(0xffdce4e4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003d40),
      surfaceTint: Color(0xff00696f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00797f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003d40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3a767a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff343351),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6c6a8b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff3fbfb),
      onSurface: Color(0xff0b1213),
      onSurfaceVariant: Color(0xff2a393a),
      outline: Color(0xff465556),
      outlineVariant: Color(0xff607071),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a3232),
      inversePrimary: Color(0xff00dce6),
      primaryFixed: Color(0xff00797f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005e64),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3a767a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1d5d61),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6c6a8b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff535172),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0c8c8),
      surfaceBright: Color(0xfff3fbfb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf5f5),
      surfaceContainer: Color(0xffe1eaea),
      surfaceContainerHigh: Color(0xffd6dedf),
      surfaceContainerHighest: Color(0xffcbd3d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003235),
      surfaceTint: Color(0xff00696f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005256),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003235),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff0a5156),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2a2947),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff484665),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff3fbfb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff202f30),
      outlineVariant: Color(0xff3d4c4d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a3232),
      inversePrimary: Color(0xff00dce6),
      primaryFixed: Color(0xff005256),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00393c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff0a5156),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00393c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff484665),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff312f4e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb2babb),
      surfaceBright: Color(0xfff3fbfb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeaf2f3),
      surfaceContainer: Color(0xffdce4e4),
      surfaceContainerHigh: Color(0xffced6d6),
      surfaceContainerHighest: Color(0xffc0c8c8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe3fdff),
      surfaceTint: Color(0xff00dce6),
      onPrimary: Color(0xff00373a),
      primaryContainer: Color(0xff00f3ff),
      onPrimaryContainer: Color(0xff006b71),
      secondary: Color(0xff95d1d5),
      onSecondary: Color(0xff00373a),
      secondaryContainer: Color(0xff054f53),
      onSecondaryContainer: Color(0xff84bfc4),
      tertiary: Color(0xfffbf7ff),
      onTertiary: Color(0xff2f2d4b),
      tertiaryContainer: Color(0xffdcd8ff),
      onTertiaryContainer: Color(0xff5f5d7e),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0d1515),
      onSurface: Color(0xffdce4e4),
      onSurfaceVariant: Color(0xffb9cacb),
      outline: Color(0xff849495),
      outlineVariant: Color(0xff3a494b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdce4e4),
      inversePrimary: Color(0xff00696f),
      primaryFixed: Color(0xff6ff6ff),
      onPrimaryFixed: Color(0xff002022),
      primaryFixedDim: Color(0xff00dce6),
      onPrimaryFixedVariant: Color(0xff004f53),
      secondaryFixed: Color(0xffb1edf2),
      onSecondaryFixed: Color(0xff002022),
      secondaryFixedDim: Color(0xff95d1d5),
      onSecondaryFixedVariant: Color(0xff054f53),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff1a1835),
      tertiaryFixedDim: Color(0xffc6c2e9),
      onTertiaryFixedVariant: Color(0xff454363),
      surfaceDim: Color(0xff0d1515),
      surfaceBright: Color(0xff333b3b),
      surfaceContainerLowest: Color(0xff081010),
      surfaceContainerLow: Color(0xff151d1e),
      surfaceContainer: Color(0xff192122),
      surfaceContainerHigh: Color(0xff232b2c),
      surfaceContainerHighest: Color(0xff2e3637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe3fdff),
      surfaceTint: Color(0xff00dce6),
      onPrimary: Color(0xff00373a),
      primaryContainer: Color(0xff00f3ff),
      onPrimaryContainer: Color(0xff004c50),
      secondary: Color(0xffabe7eb),
      onSecondary: Color(0xff002b2d),
      secondaryContainer: Color(0xff5f9a9f),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffbf7ff),
      onTertiary: Color(0xff2f2d4b),
      tertiaryContainer: Color(0xffdcd8ff),
      onTertiaryContainer: Color(0xff434160),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0d1515),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffcfdfe0),
      outline: Color(0xffa5b5b6),
      outlineVariant: Color(0xff839394),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdce4e4),
      inversePrimary: Color(0xff005055),
      primaryFixed: Color(0xff6ff6ff),
      onPrimaryFixed: Color(0xff001416),
      primaryFixedDim: Color(0xff00dce6),
      onPrimaryFixedVariant: Color(0xff003d40),
      secondaryFixed: Color(0xffb1edf2),
      onSecondaryFixed: Color(0xff001416),
      secondaryFixedDim: Color(0xff95d1d5),
      onSecondaryFixedVariant: Color(0xff003d40),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff0f0d2a),
      tertiaryFixedDim: Color(0xffc6c2e9),
      onTertiaryFixedVariant: Color(0xff343351),
      surfaceDim: Color(0xff0d1515),
      surfaceBright: Color(0xff3e4647),
      surfaceContainerLowest: Color(0xff030809),
      surfaceContainerLow: Color(0xff171f20),
      surfaceContainer: Color(0xff21292a),
      surfaceContainerHigh: Color(0xff2c3435),
      surfaceContainerHighest: Color(0xff373f40),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe3fdff),
      surfaceTint: Color(0xff00dce6),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff00f3ff),
      onPrimaryContainer: Color(0xff002a2d),
      secondary: Color(0xffbffbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff91cdd1),
      onSecondaryContainer: Color(0xff000e0f),
      tertiary: Color(0xfffbf7ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffdcd8ff),
      onTertiaryContainer: Color(0xff242240),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0d1515),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe3f3f4),
      outlineVariant: Color(0xffb5c6c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdce4e4),
      inversePrimary: Color(0xff005055),
      primaryFixed: Color(0xff6ff6ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff00dce6),
      onPrimaryFixedVariant: Color(0xff001416),
      secondaryFixed: Color(0xffb1edf2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff95d1d5),
      onSecondaryFixedVariant: Color(0xff001416),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc6c2e9),
      onTertiaryFixedVariant: Color(0xff0f0d2a),
      surfaceDim: Color(0xff0d1515),
      surfaceBright: Color(0xff495252),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff192122),
      surfaceContainer: Color(0xff2a3232),
      surfaceContainerHigh: Color(0xff353d3d),
      surfaceContainerHighest: Color(0xff404849),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surfaceContainerLowest,
      canvasColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimaryContainer,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: colorScheme.surfaceContainer,
        margin: const EdgeInsets.only(bottom: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
    );


  List<ExtendedColor> get extendedColors => [
  ];
}

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


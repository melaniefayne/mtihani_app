import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xFF000000), // Black for buttons and accents
      primaryContainer: Color(0xFFF5F5F5), // Soft gray for cards/containers
      secondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFDADADA),
      tertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFFEDEDED),
      appBarColor: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      buttonMinSize: Size(48, 48),
      textButtonRadius: 8,
      elevatedButtonRadius: 8,
      outlinedButtonRadius: 8,
      cardRadius: 12,
    ),
    scaffoldBackground: const Color(0xFFFFFFFF),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.light),
    fontFamily: GoogleFonts.figtree().fontFamily,
  );

  static ThemeData dark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xFFFFFFFF), // white text on dark background
      primaryContainer: Color(0xFF1C1C1C),
      secondary: Color(0xFFCCCCCC),
      secondaryContainer: Color(0xFF2C2C2C),
      tertiary: Color(0xFFEDEDED),
      tertiaryContainer: Color(0xFF444444),
      appBarColor: Color(0xFF1C1C1C),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      buttonMinSize: Size(48, 48),
      textButtonRadius: 8,
      elevatedButtonRadius: 8,
      outlinedButtonRadius: 8,
      cardRadius: 12,
    ),
    scaffoldBackground: const Color(0xFF121212),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.dark),
    fontFamily: GoogleFonts.figtree().fontFamily,
  );
}

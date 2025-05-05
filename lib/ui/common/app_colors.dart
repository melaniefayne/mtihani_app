import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF9600FF);
const Color kcPrimaryColorDark = Color(0xFF300151);
const Color kcDarkGreyColor = Color(0xFF1A1B1E);
const Color kcMediumGrey = Color(0xFF474A54);
const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
const Color kcVeryLightGrey = Color(0xFFE3E3E3);
const Color kcBackgroundColor = kcDarkGreyColor;

List<Color> getChartColors(int seriesLength, ThemeData theme) {
  return seriesLength > defaultChartColors.length
      ? List.generate(seriesLength, (i) => theme.primaryColor)
      : defaultChartColors.sublist(0, seriesLength);
}

List<Color> getOnChartColors(int seriesLength, ThemeData theme) {
  return seriesLength > defaultChartColors.length
      ? List.generate(seriesLength, (i) => theme.primaryColor)
      : defaultChartColors
          .map((e) => defaultTextChartColors[e] ?? Colors.white)
          .toList();
}

const Color appGreen = Color(0xFF18A558);
const Color appBlue = Color(0xFF0292B7);
const Color appPeach = Color(0xFFDF7A57);
const Color appRed = Color(0xFFF54D3D);
const Color appPurple = Color(0xFF7A77E9);

// chart constants
List<Color> defaultChartColors = const [
  appBlue,
  appGreen,
  Color(0xFFE59349),
  Color(0xFFF9E56A),
  appRed,
  appPurple,
  Color(0xFF84D3C5),
  Color(0xFF5C99F0),
  Color(0xFF955670),
  appPeach,
  Color(0xFF3D5B59),
  Color(0xFFDB668D),
  Color(0xFF000C66),
  Color(0xFFF3E1C0),
];

Map<Color, Color> defaultTextChartColors = {
  appBlue: Colors.white, // Blue
  appGreen: Colors.white, // Green
  const Color(0xFFE59349): Colors.white, // Orange
  appRed: Colors.white, // Red
  const Color(0xFFF9E56A): Colors.black, // Yellow
  appPurple: Colors.white, // Purple
  const Color(0xFF84D3C5): Colors.black, // Light teal
  const Color(0xFF5C99F0): Colors.white, // Sky blue
  const Color(0xFF955670): Colors.white, // Dark purple
  appPeach: Colors.white, // Peach
  const Color(0xFF3D5B59): Colors.white, // Dark teal
  const Color(0xFFDB668D): Colors.white, // Pink
  const Color(0xFF000C66): Colors.white, // Navy
  const Color(0xFFF3E1C0): Colors.black, // Beige
};

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ThemeData blueTheme = FlexColorScheme.light(
  primary: Colors.white,
  secondary: Colors.black,
).toTheme;

final ThemeData yellowTheme = FlexColorScheme.light(
  primary: Colors.black,
  secondary: Colors.white,
).toTheme;

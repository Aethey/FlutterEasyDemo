import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ThemeData blueTheme = FlexColorScheme.light(
  primary: Colors.blue,
  secondary: Colors.blueGrey,
).toTheme;

final ThemeData yellowTheme = FlexColorScheme.light(
  primary: Colors.yellow,
  secondary: Colors.amber,
).toTheme;

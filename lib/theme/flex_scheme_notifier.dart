import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNotifierProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends ChangeNotifier {
  FlexScheme _scheme = FlexScheme.material; // default

  FlexScheme get scheme => _scheme;

  void setScheme(FlexScheme newScheme) {
    if (_scheme != newScheme) {
      _scheme = newScheme;
      notifyListeners();
    }
  }
}

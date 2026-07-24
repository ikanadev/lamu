import 'package:flutter/material.dart';

abstract final class AppSpacing {
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s24 = 24;
  static const double s32 = 32;
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;

  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
}

/// Component-level defaults live here so call sites don't restyle individually.
ThemeData buildAppTheme(ColorScheme colorScheme) {
  return ThemeData(
    colorScheme: colorScheme,
    cardTheme: const CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
    ),
  );
}

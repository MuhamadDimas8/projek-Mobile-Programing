import 'package:flutter/material.dart';

class AppColors {
  static Color backgroundColor1(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color backgroundColor2(BuildContext context) =>
      Theme.of(context).colorScheme.secondary.withOpacity(0.1);

  static Color backgroundColor3(BuildContext context) =>
      Theme.of(context).cardColor;

  static Color backgroundColor4(BuildContext context) =>
      Theme.of(context).canvasColor;

  static Color primaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color textColor1(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

  static Color textColor2(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7) ?? Colors.grey;

  static Color buttonColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
}

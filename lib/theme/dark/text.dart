import 'package:flutter/material.dart';

@immutable
class BodyMediumStyle extends TextStyle {
  const BodyMediumStyle(
      {super.color = Colors.white,
      super.fontSize = 20,
      super.fontWeight = FontWeight.w500});
}

@immutable
class LabelSmallStyle extends TextStyle {
  const LabelSmallStyle(
      {super.color = Colors.grey,
      super.fontWeight = FontWeight.w700,
      super.fontSize = 14});
}

@immutable
class MyTextTheme extends TextTheme {
  const MyTextTheme(
      {super.bodyMedium = const BodyMediumStyle(),
      super.labelSmall = const LabelSmallStyle()});
}

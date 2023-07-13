import 'package:flutter/material.dart';

@immutable
class MyAppBarTheme extends AppBarTheme {
  const MyAppBarTheme(
      {super.backgroundColor = const Color.fromARGB(255, 31, 31, 31),
      super.titleTextStyle = const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      super.centerTitle = true,
      super.elevation = 0,
      super.foregroundColor = const Color.fromARGB(255, 31, 31, 31),
      super.surfaceTintColor = const Color.fromARGB(255, 31, 31, 31),
      super.iconTheme = const IconThemeData(color: Colors.white)});
}

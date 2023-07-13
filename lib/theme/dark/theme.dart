import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'list_title.dart';
import 'text.dart';

final ThemeData darkThemeData = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
  textTheme: const MyTextTheme(),
  appBarTheme: const MyAppBarTheme(),
  listTileTheme: const MyListTitleTheme(),
  dividerColor: Colors.white24,
  useMaterial3: true,
);

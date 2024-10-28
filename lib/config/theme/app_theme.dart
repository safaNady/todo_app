import 'package:flutter/material.dart';
import 'package:todo_app/cores/utils/app_styles.dart';
import 'package:todo_app/cores/utils/colors_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.blue,
          primary: ColorsManager.blue,
          onPrimary: ColorsManager.white),
      useMaterial3: false,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.blue,
          titleTextStyle: LightAppStyle.appBar),
      scaffoldBackgroundColor: ColorsManager.greenAccent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: ColorsManager.blue,
          unselectedItemColor: ColorsManager.gray,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(size: 33),
          unselectedIconTheme: IconThemeData(size: 33)),
      bottomAppBarTheme:
          const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: StadiumBorder(
            side: BorderSide(color: ColorsManager.white, width: 4)),
        backgroundColor: ColorsManager.blue,
        iconSize: 26,
        foregroundColor: ColorsManager.white,
      ));
  static ThemeData dark = ThemeData();
}

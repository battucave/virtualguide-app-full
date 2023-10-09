import 'package:flutter/material.dart';

class DarkTheme {
  // Dark Theme
  static ThemeData dark({required BuildContext context}) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,

      scaffoldBackgroundColor: blackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: blackColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          letterSpacing: 0.8,
        ),
        iconTheme: IconThemeData(color: whiteColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: blackColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        displayColor: whiteColor,
        bodyColor: whiteColor,
      ),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: whiteColor,
      ),
    );
  }

  static Color primaryColor = const Color(0xFF17CE92);
  static Color darkPrimaryColor = const Color(0xFF35383F);
  static Color blackColor = const Color(0xFF181A20);
  static Color greyColor = const Color(0xFF9F9F9F);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color darkGreyColor = const Color(0xFF1F222A);
  static Color darkGreyColor100 = const Color(0xFFE1E1E1);
  static Color darkGreyColor200 = const Color(0xFF616161);
  static Color darkGreyColor300 = const Color(0xFF1F222A);
  static Color darkGreyColor400 = const Color(0xFFE1E1E2);
  static Color darkGreyColor500 = const Color(0xFFE0E0E0);
  static Color darkGreyColor600 = const Color(0xFF34373E);
  static Color darkGreyColor700 = const Color(0xFF35373E);
  static Color transparent = Colors.transparent;

  static Color green = const Color(0xFF4AAF57);
  static Color blue = const Color(0xFF1A96F0);
  static Color brown = const Color(0xFF7A5548);
  static Color yellow = const Color(0xFFFFC02D);
  static Color water = const Color(0xFF00BCD3);
  static Color red = const Color(0xFFF54336);
  static Color lightGreen = const Color(0xFFCDDC4C);
  static Color purple = const Color(0xFF9D28AC);
  static Color darkBlue = const Color(0xFF60738A);
}

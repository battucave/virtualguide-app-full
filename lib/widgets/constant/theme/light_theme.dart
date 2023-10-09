import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData light({required BuildContext context}) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: whiteColor,
      appBarTheme: AppBarTheme(
        backgroundColor: whiteColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          letterSpacing: 0.8,
        ),
        iconTheme: IconThemeData(color: blackColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
        selectedItemColor: LightTheme.primaryColor,
        unselectedItemColor: LightTheme.greyColor,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        displayColor: blackColor,
        bodyColor: blackColor,
      ),
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: blackColor,
      ),
    );
  }

  static Color primaryColor = const Color(0xFF17CE92);
  static Color lightPrimaryColor = const Color(0xFFE8FAF4);
  static Color blackColor = const Color(0xFF181A20);
  static Color greyColor = const Color(0xFF9F9F9F);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color lightGreyColor = const Color(0xFFF5F5F5);
  static Color lightGreyColor100 = const Color(0xFFEFEFEF);
  static Color lightGreyColor200 = const Color(0xFFBBBBBB);
  static Color lightGreyColor300 = const Color(0xFFFAFAFA);
  static Color lightGreyColor400 = const Color(0xFF636363);
  static Color lightGreyColor500 = const Color(0xFF616161);
  static Color lightGreyColor700 = const Color(0xFF9E9E9E);
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

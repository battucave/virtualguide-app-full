import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class Alerts {
  static void showErrorDialog(
      {required BuildContext context,
      required String errorMessage,
      required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AdaptiveTheme.of(context).mode.isLight
              ? LightTheme.whiteColor
              : DarkTheme.darkGreyColor300,
          title: Text(title),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: LightTheme.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

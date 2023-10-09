import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class AuthButton extends StatelessWidget {
  final bool isGoogle;
  final VoidCallback onTap;
  const AuthButton({super.key, required this.isGoogle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AdaptiveTheme.of(context).mode.isLight
              ? LightTheme.lightGreyColor
              : DarkTheme.darkGreyColor,
          border: Border.all(
              color: AdaptiveTheme.of(context).mode.isLight
                  ? LightTheme.lightGreyColor100
                  : DarkTheme.darkGreyColor600,
              width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 15.0,
          ),
          child: isGoogle
              ? Image.asset(
                  'assets/images/google.png', // Replace with your Google icon image path
                  width: 24.0,
                  height: 24.0,
                )
              : AdaptiveTheme.of(context).mode.isLight
                  ? Icon(Icons.phone,size: 24.0,color: LightTheme.blackColor,)
                  : Icon(Icons.phone,size: 24.0,color: DarkTheme.whiteColor,),
        ),
      ),
    );
  }
}

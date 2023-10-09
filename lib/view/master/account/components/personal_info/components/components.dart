
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/account/account_provider.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class PersonalInfoComponents {
  // Email
  static Widget emailWidget({required BuildContext context,required TextEditingController textEditingController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
        Consumer<AccountProvider>(
          builder: (context, provider, child) {
            return TextFormField(
              controller: textEditingController,
              // textInputAction: TextInputAction.go,
              // onFieldSubmitted: (v) => provider.updateProfile(context: context),
              cursorColor: LightTheme.primaryColor,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.email),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: AdaptiveTheme.of(context).mode.isLight
                      ? LightTheme.lightGreyColor700
                      : DarkTheme.darkGreyColor700,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: LightTheme.primaryColor,
                  ),
                ),
              ),
              validator: (v) {
                if (v.toString().isEmpty) {
                  return "Please Enter Email";
                } else if (!v.toString().contains('@')) {
                  return 'Please enter a valid email address!';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  // DisplayName
  static Widget displayNameWidget({required BuildContext context,required TextEditingController textEditingController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DisplayName",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
        Consumer<AccountProvider>(
          builder: (context, provider, child) {
            return TextFormField(
              controller: textEditingController,
              // textInputAction: TextInputAction.go,
              // onFieldSubmitted: (v) => provider.updateProfile(context: context),
              cursorColor: LightTheme.primaryColor,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.person),
                hintText: "DisplayName",
                hintStyle: TextStyle(
                  color: AdaptiveTheme.of(context).mode.isLight
                      ? LightTheme.lightGreyColor700
                      : DarkTheme.darkGreyColor700,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: LightTheme.primaryColor,
                  ),
                ),
              ),
              validator: (v) {
                if (v.toString().isEmpty) {
                  return "Please Enter DisplayName";
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }
}

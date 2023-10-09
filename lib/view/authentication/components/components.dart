import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/authentication/authentication_provider.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class AuthComponents {
  // Auth Heading
  static Widget headingWidget(
      {required BuildContext context,
      required String title,
      required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 13.0,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
      ],
    );
  }

  // Email
  static Widget emailWidget({required BuildContext context}) {
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
        Consumer<AuthenticationProvider>(
          builder: (context, provider, child) {
            return TextFormField(
              controller: provider.emailController,
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (v) => provider.signIn(context: context),
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

  // Phone
  static Widget phoneWidget({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
        Consumer<AuthenticationProvider>(
          builder: (context, provider, child) {
            return TextFormField(
              enabled: !provider.isSendOtpCode,
              controller: provider.phoneController,
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (v) => provider.signIn(context: context),
              cursorColor: LightTheme.primaryColor,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.phone),
                hintText: "Phone",
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
                  return "Please Enter Phone Number";
                }
                // Remove any non-digit characters from the input.
                final numericValue =
                    v.toString().replaceAll(RegExp(r'[^0-9]'), '');

                if (numericValue.length != 10) {
                  return 'Please enter a valid 10-digit phone number';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  // OTP
  static Widget otpWidget({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "OTP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
        Consumer<AuthenticationProvider>(
          builder: (context, provider, child) {
            return TextFormField(
              enabled: provider.isSendOtpCode,
              controller: provider.otpController,
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (v) => provider.signIn(context: context),
              cursorColor: LightTheme.primaryColor,
              keyboardType: TextInputType.phone,
              maxLength: 6,
              decoration: InputDecoration(
                suffixIcon: provider.isSendOtpCode
                    ? verifyOTP()
                    : Icon(
                        Icons.lock,
                        color: LightTheme.primaryColor,
                      ),
                hintText: "OTP",
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
                  return "Please Enter OTP";
                }
                // Remove any non-digit characters from the input.
                final numericValue =
                    v.toString().replaceAll(RegExp(r'[^0-9]'), '');

                if (numericValue.length != 6) {
                  return 'Please enter a valid 6-digit OTP';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  // Password
  static Widget passwordWidget({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
        Consumer<AuthenticationProvider>(
          builder: (context, provider, child) {
            return TextFormField(
              obscureText: provider.hidePassword,
              controller: provider.passController,
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (v) => provider.signIn(context: context),
              cursorColor: LightTheme.primaryColor,
              decoration: InputDecoration(
                hintText: "Password",
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
                suffixIcon: IconButton(
                  onPressed: () {
                    provider.hidePass(provider.hidePassword);
                  },
                  icon: provider.hidePassword
                      ? Icon(
                          Icons.visibility_off,
                          color: LightTheme.primaryColor,
                        )
                      : Icon(
                          Icons.visibility,
                          color: LightTheme.primaryColor,
                        ),
                ),
              ),
              validator: (v) {
                if (v.toString().isEmpty) {
                  return "Please Enter Password";
                } else if (v.toString().length < 6) {
                  return "Password should be at least 6 characters";
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  // Remember Me
  static Widget rememberWidget({required BuildContext context}) {
    return Row(
      children: <Widget>[
        Consumer<AuthenticationProvider>(builder: (context, provider, child) {
          return Checkbox(
            activeColor: LightTheme.primaryColor,
            value: provider.isRememberMe,
            onChanged: (value) {
              provider.rememberMe(value);
            },
          );
        }),
        const SizedBox(width: 8.0),
        Text(
          'Remember me ',
          style: TextStyle(
            fontSize: 15.0,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.blackColor
                : DarkTheme.whiteColor,
          ),
        ),
      ],
    );
  }

  // Forgot Password
  static Widget forgotPassWidget({required BuildContext context}) {
    return Center(
      child: Text(
        "Forgot Password ?",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: LightTheme.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Option Components
  static Widget optionWidget({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1.5,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.lightGreyColor100
                : DarkTheme.darkGreyColor600,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Text(
          "   or continue with   ",
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.lightGreyColor500
                : DarkTheme.whiteColor,
            fontSize: 17.0,
          ),
        ),
        Expanded(
          child: Container(
            height: 1.5,
            color: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.lightGreyColor100
                : DarkTheme.darkGreyColor600,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }

  // Check Otp Resend
  static Widget resendOtpWidget() {
    return Align(
      alignment: Alignment.center,
      child: Consumer<AuthenticationProvider>(
        builder: (context, provider, child) {
          return provider.isSendOtpCode
              ? provider.isTimerActive
                  ? Text(
                      "${provider.secondsRemaining}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: LightTheme.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : GestureDetector(
                      onTap: () => provider.verifyPhoneNumber(context: context),
                      child: Text(
                        "ReSend OTP",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: LightTheme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
              : const SizedBox();
        },
      ),
    );
  }

  static Widget verifyOTP() {
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () => provider.verifyOTPWithFirebase(context: context),
          child: const Text("Verify"),
        );
      },
    );
  }
}

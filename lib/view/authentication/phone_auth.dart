import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/authentication/authentication_provider.dart';
import 'package:virtualguide/view/authentication/components/components.dart';
import 'package:virtualguide/widgets/common/button/auth_btn.dart';
import 'package:virtualguide/widgets/common/button/submit_btn.dart';
import 'package:virtualguide/widgets/constant/constant.dart';

class PhoneAuthentication extends StatelessWidget {
  const PhoneAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(VirtualGuide.padding + 5),
          child: Consumer<AuthenticationProvider>(
            builder: (context, provider, child) {
              return provider.isSendOtpCode
                  ? const SizedBox(
                      height: 0,
                    )
                  : SubmitButton(
                      title: "Continue",
                      onTap: () => provider.verifyPhoneNumber(context: context),
                    );
            },
          ),
        ),
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: provider.phoneFormKey,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: VirtualGuide.padding * 1.5,
                  vertical: VirtualGuide.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthComponents.headingWidget(
                      context: context,
                      title: 'Hello there 👋',
                      subTitle:
                          'Please enter your phone number to create an account.'),
                  const SizedBox(height: VirtualGuide.height * 2),
                  AuthComponents.phoneWidget(context: context),
                  const SizedBox(height: VirtualGuide.height),
                  AuthComponents.otpWidget(context: context),
                  const SizedBox(height: VirtualGuide.height * 2),
                  AuthComponents.resendOtpWidget(),
                  const SizedBox(height: VirtualGuide.height * 2),
                  AuthComponents.optionWidget(context: context),
                  const SizedBox(height: VirtualGuide.height * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AuthButton(
                        isGoogle: true,
                        onTap: () =>
                            provider.signInWithGoogle(context: context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

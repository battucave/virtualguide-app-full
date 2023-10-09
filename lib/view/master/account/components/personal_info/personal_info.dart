import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/account/account_provider.dart';
import 'package:virtualguide/view/master/account/components/personal_info/components/components.dart';
import 'package:virtualguide/view/master/account/components/personal_info/components/profile_avatar.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayNameController.text =
        FirebaseAuth.instance.currentUser!.displayName ?? '';
    emailController.text = FirebaseAuth.instance.currentUser!.email ?? '';
    phoneNumberController.text =
        FirebaseAuth.instance.currentUser!.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Info",
        ),
        actions: const [
          Icon(Icons.edit),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(VirtualGuide.padding + 5),
          child: GestureDetector(
            onTap: () => provider.updateProfile(
              context: context,
              email: emailController.text,
              displayName: displayNameController.text,
            ),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: LightTheme.primaryColor,
                borderRadius: BorderRadius.circular(60.0),
              ),
              child: Consumer<AccountProvider>(
                builder: (context, provider, child) {
                  return Center(
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: LightTheme.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
      body: SafeArea(
        child: Consumer<AccountProvider>(
          builder: (context, provider, child) {
            return Form(
              key: provider.personalInfoFormKey,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: VirtualGuide.padding * 1.5,
                    vertical: VirtualGuide.padding),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: VirtualGuide.height,
                        ),
                        ProfileAvatar(
                          radius: 45,
                          imageUrl: provider
                              .getUserPhotoUrl(), // Replace with your image URL or path
                          onEditTap: () {
                            // Handle edit button tap here
                            provider.pickAndCropImage(context: context);
                          },
                        ),
                        const SizedBox(
                          height: VirtualGuide.height * 4,
                        ),
                        PersonalInfoComponents.displayNameWidget(
                          context: context,
                          textEditingController: displayNameController,
                        ),
                        const SizedBox(height: VirtualGuide.height + 5),
                        PersonalInfoComponents.emailWidget(
                          context: context,
                          textEditingController: emailController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

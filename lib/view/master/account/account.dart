import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/account/account_provider.dart';
import 'package:virtualguide/view/master/account/components/about/about.dart';
import 'package:virtualguide/view/master/account/components/help_center/help_center.dart';
import 'package:virtualguide/view/master/account/components/personal_info/personal_info.dart';
import 'package:virtualguide/view/master/account/components/privacy_policy.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';
import 'package:virtualguide/controller/provider/authentication/authentication_provider.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: VirtualGuide.padding * 2),
          child: Image.asset(
            "assets/images/green_logo.png",
            height: 10,
          ),
        ),
        leadingWidth: 40,
        title: const Text(
          "Account",
        ),
      ),
      body: Consumer<AccountProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(VirtualGuide.padding * 1.5),
            child: ListView(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: LightTheme.lightGreyColor,
                    backgroundImage: NetworkImage(provider.getUserPhotoUrl()),
                  ),
                  title: Text(
                    provider.getUserDisplayName(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      provider.getUserEmail(),
                      style: TextStyle(
                        fontSize: 12,
                        color: LightTheme.greyColor,
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonalInfo(),
                        ),
                      );
                      provider.reloadUserData();
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(
                  height: VirtualGuide.height * 1.5,
                ),
                Image.asset("assets/images/pro_banner.png"),
                const SizedBox(
                  height: VirtualGuide.height * 1.5,
                ),
                Row(
                  children: [
                    Text(
                      "General",
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).mode.isLight
                            ? LightTheme.lightGreyColor200
                            : DarkTheme.darkGreyColor200,
                      ),
                    ),
                    const SizedBox(
                      width: VirtualGuide.height-5,
                    ),
                    Expanded(
                      child: Divider(
                        color: AdaptiveTheme.of(context).mode.isLight
                            ? LightTheme.lightGreyColor200
                            : DarkTheme.darkGreyColor200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: VirtualGuide.height+5,
                ),
                ListTile(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalInfo(),
                      ),
                    );
                    provider.reloadUserData();
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.person),
                  title: const Text(
                    "Personal Info",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.security),
                  title: Text(
                    "Security",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.language),
                  title: Text(
                    "Language",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.remove_red_eye),
                  title: const Text(
                    "Dark Mode",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    trackColor: LightTheme.lightGreyColor100,
                    value: provider.darkModeEnabled,
                    onChanged: (value) {
                      provider.toggleDarkMode(context: context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).mode.isLight
                            ? LightTheme.lightGreyColor200
                            : DarkTheme.darkGreyColor200,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Divider(
                        color: AdaptiveTheme.of(context).mode.isLight
                            ? LightTheme.lightGreyColor200
                            : DarkTheme.darkGreyColor200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpCenter()),
                    );
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.help),
                  title: const Text(
                    "Help Center",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy()),
                    );
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.lock),
                  title: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.info),
                  title: const Text(
                    "About VirtualGuide",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                ),
                Consumer<AuthenticationProvider>(
                    builder: (context, authProvider, child) {
                  return ListTile(
                    onTap: () => authProvider.signOut(context: context),
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.logout,
                      color: LightTheme.red,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: LightTheme.red,
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/firebase/firebase_options.dart';
import 'package:virtualguide/controller/provider/account/account_provider.dart';
import 'package:virtualguide/controller/provider/authentication/authentication_provider.dart';
import 'package:virtualguide/controller/provider/chat/chat_provider.dart';
import 'package:virtualguide/controller/provider/navigation_provider.dart';
import 'package:virtualguide/responsive/responsive.dart';
import 'package:virtualguide/view/authentication/welcome_screen.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:virtualguide/view/master/master_screen.dart';

import 'widgets/desktop_view/desktop_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* Firebase Initialize */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check User Logging or Not
  final auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  runApp(
    Builder(builder: (context) {
      if (Responsive.isDesktop(context)) {
        return DeskTopView(
          user: user,
        );
      } else {
        return MyApp(user: user);
      }
    }),
  );
}

class MyApp extends StatelessWidget {
  final User? user;
  const MyApp({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = user != null;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
            create: (context) => NavigationProvider()),
        ChangeNotifierProvider<ChatProvider>(
            create: (context) => ChatProvider()),
        ChangeNotifierProvider<AccountProvider>(
            create: (context) => AccountProvider()),
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (context) => AuthenticationProvider()),
      ],
      child: OverlaySupport.global(
        child: AdaptiveTheme(
          light: LightTheme.light(context: context),
          dark: DarkTheme.dark(context: context),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) {
            return MaterialApp(
              title: 'VirtualGuide',
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              home: isLoggedIn ? const MasterScreen() : const WelcomeScreen(),
            );
          },
        ),
      ),
    );
  }
}

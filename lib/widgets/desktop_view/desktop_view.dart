import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/main.dart';
import 'package:virtualguide/widgets/common/app_review.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

import '../constant/constant.dart';

class DeskTopView extends StatelessWidget {
  final User? user;
  const DeskTopView({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: LightTheme.blackColor,
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(VirtualGuide.padding * 5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 30.0, bottom: 20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.bold,
                                  color: LightTheme.primaryColor),
                              child: AnimatedTextKit(
                                pause: const Duration(milliseconds: 3000),
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                      'VirtualGuide:Creativity & Productivity'),
                                  TypewriterAnimatedText(
                                      'VirtualGuide: Your Personal AI Assistant'),
                                  TypewriterAnimatedText(
                                      'VirtualGuide: The Future of Productivity'),
                                  TypewriterAnimatedText(
                                      'VirtualGuide: Unlock Your Full Potential'),
                                ],
                                onTap: null,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            "Welcome to VirtualGuide, the ultimate AI-powered assistant designed to revolutionize the way you approach writing, creativity, and productivity. With VirtualGuide by your side, you can effortlessly unlock your full potential and accomplish more than ever before. Seamlessly combining cutting-edge artificial intelligence with an intuitive chat-based interface, VirtualGuide empowers you to write captivating articles, generate academic content, craft compelling stories, create personalized poems, compose professional emails, and much more. Explore a world of endless possibilities and enhance your productivity across Android, iOS, Web, Windows, macOS, and Linux platforms. Download VirtualGuide today and experience the power of AI in the palm of your hand.",
                            style: TextStyle(
                              color: LightTheme.whiteColor,
                              height: 2.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: LightTheme.primaryColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                  color: LightTheme.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 150,
                        child: AppReviewSection(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: DevicePreview(
                backgroundColor: LightTheme.whiteColor,
                isToolbarVisible: false,
                builder: (context) => MyApp(user: user), // Wrap your app
              ),
            )
          ],
        ),
      ),
    );
  }
}

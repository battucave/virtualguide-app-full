import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class EmptyChatBackground extends StatelessWidget {
  const EmptyChatBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: VirtualGuide.height * 3),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: AdaptiveTheme.of(context).mode.isLight
                  ? Image.asset("assets/images/light_grey_logo.png") : Image.asset("assets/images/dark_grey_logo.png"),
            ),
            const SizedBox(height: VirtualGuide.height*2),
            Text(
              'VirtualGuide',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.lightGreyColor200
                    : DarkTheme.darkGreyColor200,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VirtualGuide.height*2),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.lightGreyColor : DarkTheme.darkGreyColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  "Answer all your questions.\n(Just ask me anything you like!)",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: AdaptiveTheme.of(context).mode.isLight
                        ? LightTheme.lightGreyColor200 : DarkTheme.darkGreyColor200,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: VirtualGuide.height),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.lightGreyColor : DarkTheme.darkGreyColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  "Generate all the text you want.\n(essays, articles, reports, stories, & more)",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AdaptiveTheme.of(context).mode.isLight
                        ? LightTheme.lightGreyColor200 : DarkTheme.darkGreyColor200,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: VirtualGuide.height),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.lightGreyColor : DarkTheme.darkGreyColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  "Conversational AI\n(I can talk to you like a natural human)",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AdaptiveTheme.of(context).mode.isLight
                        ? LightTheme.lightGreyColor200 : DarkTheme.darkGreyColor200,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: VirtualGuide.height*2),
            Text(
              "These are just a few examples of what i can do",
              style: TextStyle(
                fontSize: 12.0,
                color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.lightGreyColor200 : DarkTheme.darkGreyColor200,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

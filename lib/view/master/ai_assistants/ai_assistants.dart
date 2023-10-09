
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/view/master/ai_assistants/components/ai_assistants_category.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class AiAssistants extends StatelessWidget {
  const AiAssistants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: VirtualGuide.padding*2),
          child: Image.asset(
            "assets/images/green_logo.png",
            height: 10,
          ),
        ),
        leadingWidth: 40,
        title: const Text(
          "AI Assistants",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(VirtualGuide.padding * 1.5),
        child: DefaultTabController(
          length: VirtualGuide.aiAssistantsData.length,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: VirtualGuide.padding * 2),
                backgroundColor: LightTheme.primaryColor,
                borderWidth: 2,
                borderColor: LightTheme.primaryColor,
                unselectedBorderColor: LightTheme.primaryColor,
                unselectedBackgroundColor: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.whiteColor : DarkTheme.blackColor,
                unselectedLabelStyle: TextStyle(
                  color: LightTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                radius: 70,
                tabs: List.generate(
                  VirtualGuide.aiAssistantsData.length,
                  (index) {
                    return Tab(
                      text: VirtualGuide.aiAssistantsData[index]['title'],
                    );
                  },
                ).toList(),
              ),
              const SizedBox(
                height: VirtualGuide.height * 1.5,
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    VirtualGuide.aiAssistantsData.length,
                    (index) => AiAssistantsCategory(
                      data: VirtualGuide.aiAssistantsData[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

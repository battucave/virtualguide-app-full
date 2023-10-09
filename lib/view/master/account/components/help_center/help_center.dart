import 'package:flutter/material.dart';
import 'package:virtualguide/view/master/account/components/help_center/components/contact.dart';
import 'package:virtualguide/view/master/account/components/help_center/components/faq.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help Center",
        ),
        bottom: TabBar(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return LightTheme.whiteColor; //<-- SEE HERE
              }
              return null;
            },
          ),
          indicatorColor: LightTheme.primaryColor,
          labelColor: LightTheme.primaryColor,
          controller: _tabController,
          tabs: const [
            Tab(text: 'FAQ'),
            Tab(text: 'Contact us'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FAQPage(),
          ContactPage(),
        ],
      ),
    );
  }
}

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/constant.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

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
          "VirtualGuide",
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AdaptiveTheme.of(context).mode.isLight
                  ? Image.asset(
                "assets/images/empty.png",
                height: MediaQuery.of(context).size.width / 2,
              ) : Image.asset(
                "assets/images/dark_empty.png",
                height: MediaQuery.of(context).size.width / 2,
              ),
              const Text(
                "Empty",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text("You have no history."),
            ],
          ),
        ),
      ),
    );
  }
}

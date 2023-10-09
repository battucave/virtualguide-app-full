import 'package:flutter/material.dart';
import 'package:virtualguide/view/master/chat/components/chat_screen.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

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
          "VirtualGuide",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(VirtualGuide.padding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/green_logo.png"),
            ),
            const SizedBox(height: VirtualGuide.height * 2),
            const Text(
              'Welcome to ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VirtualGuide.height - 2),
            Text(
              'VirtualGuide',
              style: TextStyle(
                fontSize: 25,
                color: LightTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VirtualGuide.height+5),
            Padding(
              padding: const EdgeInsets.all(VirtualGuide.padding-2),
              child: Text(
                'Start Chatting with VirtualGuide now.'
                'You can ask me anything.',
                style: TextStyle(
                  fontSize: 15,
                  color: LightTheme.greyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: VirtualGuide.height*4),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(
                      aiAssistantData: {
                        "title": "VirtualGuide",
                        "route": "chat",
                      },
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: LightTheme.primaryColor,
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Center(
                  child: Text(
                    "Start Chat",
                    style: TextStyle(
                      color: LightTheme.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

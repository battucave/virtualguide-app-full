import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(VirtualGuide.padding * 1.5),
      child: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          final question = faqData[index]['question'];
          final answer = faqData[index]['answer'];
          return Card(
            elevation: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.lightGreyColor300 : DarkTheme.darkGreyColor300,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.zero,
                title: Text(question!,style: TextStyle(color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.blackColor : DarkTheme.whiteColor,),),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(answer!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Map<String, String>> faqData = [
  {
    "question": "What is VirtualGuide?",
    "answer":
        "VirtualGuide is an advanced chatbot application that provides personalized assistance and expert knowledge on various topics. It serves as a virtual companion, offering prompt and accurate responses to user queries."
  },
  {
    "question": "How does VirtualGuide work?",
    "answer":
        "VirtualGuide utilizes artificial intelligence and natural language processing technologies to understand user queries and provide relevant information. It analyzes user input, interprets intent, and generates appropriate responses based on its vast knowledge base."
  },
  {
    "question": "What kind of assistance can I get from VirtualGuide?",
    "answer":
        "VirtualGuide offers assistance on a wide range of topics, including travel recommendations, product advice, and general information. Whether you need help planning a trip, finding the right product, or seeking answers to specific questions, VirtualGuide is here to assist you."
  },
  {
    "question": "Can VirtualGuide understand multiple languages?",
    "answer":
        "Yes, VirtualGuide supports multiple languages, allowing users from different regions to interact with the chatbot in their preferred language. It employs language detection and translation capabilities to provide a seamless multilingual experience."
  },
  {
    "question": "Is my personal information safe with VirtualGuide?",
    "answer":
        "VirtualGuide takes user privacy and data security seriously. It follows stringent security measures to protect your personal information and ensures that it is handled in accordance with applicable privacy laws and regulations. For more details, please refer to our Privacy Policy."
  },
  {
    "question": "How can I access VirtualGuide?",
    "answer":
        "VirtualGuide can be accessed through our dedicated app available on iOS and Android platforms. Simply download the app from the respective app stores, install it on your device, and start interacting with VirtualGuide."
  },
  {
    "question": "Can I use VirtualGuide on my computer?",
    "answer":
        "Currently, VirtualGuide is primarily designed for mobile devices. However, we are actively working on expanding our platform compatibility to include web-based access in the near future."
  },
  {
    "question": "Is VirtualGuide available 24/7?",
    "answer":
        "Yes, VirtualGuide is available round the clock. You can access it anytime, anywhere, and receive assistance whenever you need it."
  },
  {
    "question":
        "How can I provide feedback or report issues with VirtualGuide?",
    "answer":
        "We value your feedback and encourage you to share your experiences with us. You can provide feedback or report any issues by contacting our support team through the app or visiting our website's support section."
  }
];

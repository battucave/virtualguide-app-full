import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(VirtualGuide.padding * 1.5),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              height: 65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: AdaptiveTheme.of(context).mode.isLight
                      ? LightTheme.lightGreyColor
                      : DarkTheme.darkGreyColor,
                  width: 3,
                ),
              ),
              child: Center(
                child: ListTile(
                  leading: Icon(
                    data[index]['icon'],
                    color: LightTheme.primaryColor,
                  ),
                  title: Text(
                    data[index]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<dynamic> data = [
  {"title": "Contact", "icon": Icons.contact_emergency},
  {"title": "WhatsApp", "icon": Icons.ac_unit},
  {"title": "Instagram", "icon": Icons.ac_unit},
  {"title": "Facebook", "icon": Icons.ac_unit},
  {"title": "Twitter", "icon": Icons.ac_unit},
  {"title": "Website", "icon": Icons.language}
];

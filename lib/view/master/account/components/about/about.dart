import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/constant.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(VirtualGuide.padding * 1.5),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/green_logo.png"),
            ),
            const SizedBox(height: VirtualGuide.height * 1.5),
            const Text(
              "VirtualGuide V1.0.0",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VirtualGuide.height*1.5),
            const Divider(),
            const SizedBox(
              height: 15.0,
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Job Vacancy",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Developer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Partner",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Accessibility",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Terms of Use",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Feedback",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Rate us",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Visit Our Website",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Follow us on Social Media",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

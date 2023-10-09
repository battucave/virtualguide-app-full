import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/constant.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(VirtualGuide.padding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0),
            Text(
              'At VirtualGuide, we are committed to protecting the privacy and security of our users. This Privacy Policy outlines how we collect, use, and safeguard your personal information when you use our chatbot application. By accessing or using VirtualGuide, you agree to the terms outlined in this Privacy Policy.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            // Include other sections of the Privacy Policy here...

            // Example section:
            Text(
              '1.1 Personal Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may collect certain personally identifiable information ("Personal Information") that you voluntarily provide to us when using VirtualGuide. This may include your name, email address, and other contact details. We only collect Personal Information that is necessary to provide you with the requested services and enhance your user experience.',
              style: TextStyle(fontSize: 14.0),
            ),

            // Include the remaining sections of the Privacy Policy here...

            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'If you have any questions, concerns, or requests regarding this Privacy Policy or our privacy practices, please contact us at [Contact Information].',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Please note that this is a general privacy policy template, and it is important to review and customize it to fit your specific requirements and legal obligations. It is recommended to consult with a legal professional to ensure compliance with applicable privacy laws and regulations.',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

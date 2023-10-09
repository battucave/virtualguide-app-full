import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SubmitButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: LightTheme.primaryColor,
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: LightTheme.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

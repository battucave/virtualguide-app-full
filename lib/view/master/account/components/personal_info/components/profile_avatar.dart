import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final VoidCallback? onEditTap;

  const ProfileAvatar({
    super.key,
    required this.radius,
    required this.imageUrl,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(imageUrl),
        ),
        if (onEditTap != null)
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: LightTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

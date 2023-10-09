import 'dart:async';

import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class AppReviewSection extends StatefulWidget {
  const AppReviewSection({super.key});

  @override
  State<AppReviewSection> createState() => _AppReviewSectionState();
}

class _AppReviewSectionState extends State<AppReviewSection> {
  final List<Map<String, String>> appReviews = [
    {'name': 'John Doe', 'review': 'Great app! Super helpful.'},
    {'name': 'Jane Smith', 'review': 'Amazing AI-powered assistant.'},
    {'name': 'David Johnson', 'review': 'Highly recommended for productivity.'},
    {'name': 'Emily Davis', 'review': 'Impressive features and ease of use.'},
    {'name': 'Michael Brown', 'review': 'Love the AI capabilities.'},
    {'name': 'Sarah Williams', 'review': 'Best assistant app ever!'},
    {'name': 'Christopher Lee', 'review': 'Fantastic AI assistance.'},
    {'name': 'Jessica Thompson', 'review': 'Quick and reliable support.'},
    {'name': 'Matthew Taylor', 'review': 'Top-notch AI-powered app.'},
    {'name': 'Olivia Martin', 'review': 'Highly satisfied with VirtualGuide.'},
    {'name': 'Daniel Garcia', 'review': 'Extremely useful and efficient.'},
    {'name': 'Ava Rodriguez', 'review': 'Great AI features and suggestions.'},
    {'name': 'Joseph Martinez', 'review': 'A game-changer for writers.'},
    {
      'name': 'Sophia Anderson',
      'review': 'Excellent app for boosting productivity.'
    },
    {'name': 'William Wilson', 'review': 'VirtualGuide is my go-to assistant.'},
    {'name': 'Mia Taylor', 'review': 'Superior AI capabilities.'},
    {
      'name': 'Benjamin Thomas',
      'review': 'Helps me stay organized and creative.'
    },
    {'name': 'Emily Clark', 'review': 'AI-powered assistant at its best.'},
    {
      'name': 'James Allen',
      'review': 'VirtualGuide has exceeded my expectations.'
    },
    {
      'name': 'Avery Adams',
      'review': 'Highly impressed with its functionality.'
    },
    {
      'name': 'Harper King',
      'review': 'Effortlessly enhances my writing skills.'
    },
    {'name': 'Logan Roberts', 'review': 'Incredible tool for productivity.'},
    {
      'name': 'Luna Hughes',
      'review': 'Saves me time and boosts my creativity.'
    },
    {'name': 'Elijah Green', 'review': 'Best assistant app for the price.'},
    {'name': 'Stella Murphy', 'review': 'VirtualGuide AI is impressive.'},
    {'name': 'Sebastian Turner', 'review': 'Highly recommend this app.'},
    {'name': 'Lucy Baker', 'review': 'Great customer satisfaction.'},
    {'name': 'Gabriel Collins', 'review': 'Best online writing assistant.'},
    {'name': 'Victoria Reed', 'review': 'VirtualGuide AI is on point.'},
    {'name': 'Jackson Phillips', 'review': 'Responsive customer support team.'},
  ];

  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_currentIndex < appReviews.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollToIndex(_currentIndex);
    });
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 200.0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: appReviews.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                width: 250.0,
                decoration: BoxDecoration(
                  color: LightTheme.blackColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: LightTheme.whiteColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appReviews[index]['name'] ?? '',
                        style: TextStyle(
                          color: LightTheme.greyColor,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        appReviews[index]['review'] ?? '',
                        maxLines: 3,
                        style: TextStyle(
                          color: LightTheme.whiteColor,
                          overflow: TextOverflow.fade,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

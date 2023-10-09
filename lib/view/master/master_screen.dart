import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/navigation_provider.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: provider.widgetOptions.elementAt(provider.currentIndex),
              ),
            ),
            bottomNavigationBar: Material(
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.mark_chat_unread),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: 'AI Assistants',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
                currentIndex: provider.currentIndex,
                onTap: (index) {
                  provider.currentIndex = index;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

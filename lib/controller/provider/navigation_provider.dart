import 'package:flutter/material.dart';
import 'package:virtualguide/view/master/account/account.dart';
import 'package:virtualguide/view/master/ai_assistants/ai_assistants.dart';
import 'package:virtualguide/view/master/chat/chat.dart';
import 'package:virtualguide/view/master/history/history.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Pages
  List<Widget> widgetOptions = const <Widget>[
    Chat(),
    AiAssistants(),
    History(),
    Account(),
  ];
}

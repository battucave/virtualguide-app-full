import 'package:flutter/material.dart';
import 'package:virtualguide/controller/user_service/dio_interceptors/dio_interceptors.dart';
import 'package:virtualguide/controller/user_service/user_service.dart';
import 'package:virtualguide/model/history/history.dart';
import 'package:virtualguide/widgets/constant/loader/flutter_overlay_loader.dart';

class ChatProvider extends ChangeNotifier {
  // checking typing system
  bool _isTyping = false;

  bool get isTyping => _isTyping;

  // Update status
  set isTyping(bool value) {
    _isTyping = value;
    notifyListeners();
  }

  // Chat Messages
  List<dynamic> messages = [];
  List<dynamic> gptMessages = [];

  // Chat History
  late Future<List<dynamic>> chatFuture;

  // Add msg in list
  void addMessages(
      {required String text, required String sender, required bool isMe}) {
    messages.insert(0, {"role": sender, "content": text, "isMe": isMe});
    gptMessages.add({"role": sender, "content": text});
    notifyListeners();
  }

  // Save History
  Future<void> insertDatabase({required BuildContext context,required String title,required String category,required dynamic aiAssistantData}) async {
    HistoryModel history = HistoryModel(
      title: title,
      messages: messages,
      gptMessages: gptMessages,
      category: category,
      createdAt: "${DateTime.now()}",
      aiAssistantData: aiAssistantData,
    );
    try{
      FlutterOverlayLoader.showLoader(context);
      await UserService.insertHistory(history).then((value) {
        FlutterOverlayLoader.hideLoader();
        Navigator.pop(context,true);
      });
    }catch (e) {
      Navigator.pop(context,true);
      FlutterOverlayLoader.hideLoader();
    }
    notifyListeners();
  }

  // Update History
  Future<void> updateDatabase(
      {required BuildContext context,required String title, required String id,required String category,required dynamic aiAssistantData}) async {
    HistoryModel history = HistoryModel(
        title: title,
        messages: messages,
        gptMessages: gptMessages,
        category: category,
        createdAt: "${DateTime.now()}",
        aiAssistantData: aiAssistantData
    );
    try{
      FlutterOverlayLoader.showLoader(context);
      await UserService.updateHistory(history,int.parse(id)).then((value) {
        FlutterOverlayLoader.hideLoader();
        Navigator.pop(context,true);
      });
    }catch (e) {
      Navigator.pop(context,true);
      FlutterOverlayLoader.hideLoader();
    }
    notifyListeners();
  }

  // Update History
  Future<void> deleteHistory(
      {required BuildContext context,required String title, required String id}) async {
    try{
      FlutterOverlayLoader.showLoader(context);
      await UserService.deleteHistory(int.parse(id),title).then((value) {
        FlutterOverlayLoader.hideLoader();
        chatFuture = UserService.getHistory();
        notifyListeners();
      });
    }catch (e) {
      FlutterOverlayLoader.hideLoader();
    }
    notifyListeners();
  }

  // Stop Chat Generating
  void stopChatGenerating() {
    isTyping = false;
    DioInterceptors.cancelRequest();
  }
}

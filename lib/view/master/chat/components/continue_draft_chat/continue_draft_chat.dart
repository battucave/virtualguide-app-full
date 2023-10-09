import 'package:flutter/material.dart';
import 'package:virtualguide/model/history/history.dart';
import 'package:virtualguide/view/master/chat/components/continue_draft_chat/components/draft_chat_screen.dart';
import 'package:virtualguide/widgets/constant/constant.dart';

class ContinueDraftChat extends StatelessWidget {
  final String id;
  final String title;
  final HistoryModel historyModel;
  final dynamic aiAssistantData;
  const ContinueDraftChat({super.key, required this.id,required this.title,required this.aiAssistantData,required this.historyModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(VirtualGuide.padding * 1.5),
          child: DraftChatScreen(
            historyModel: historyModel,
            aiAssistantData: aiAssistantData,
          ),
        ),
      ),
    );
  }
}

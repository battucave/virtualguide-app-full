import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/chat/chat_provider.dart';
import 'package:virtualguide/controller/user_service/user_service.dart';
import 'package:virtualguide/model/history/history.dart';
import 'package:virtualguide/view/master/history/components/history_list_widget.dart';
import 'package:virtualguide/widgets/common/empty_screen.dart';
import 'package:virtualguide/widgets/constant/loader/spinkit.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatProvider>().chatFuture = UserService.getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ChatProvider>(
          builder: (context, provider, child) {
            return FutureBuilder<List<dynamic>>(
              future: provider.chatFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return HistoryListWidget(
                      searchData: searchData(historyData: snapshot.data!),
                      historyData: snapshot.data!,
                    );
                  } else {
                    return const EmptyScreen();
                  }
                } else if (snapshot.hasError) {
                  return const EmptyScreen();
                } else {
                  return Center(child: Spinkit.spinkit);
                }
              },
            );
          },
        ),
      ),
    );
  }

  List<HistoryModel> searchData({required List<dynamic> historyData}) {
    return historyData.map(
          (e) {
        return HistoryModel(
          title: e['title'],
          messages: e['messages'],
          gptMessages: e['gptMessages'],
          createdAt: e['createdAt'],
          category: e['category'],
          aiAssistantData: e['aiAssistantData'],
        );
      },
    ).toList();
  }
}

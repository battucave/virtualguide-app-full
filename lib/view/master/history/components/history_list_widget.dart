import 'package:flutter/material.dart';
import 'package:virtualguide/model/history/history.dart';
import 'package:virtualguide/view/master/history/components/history_tile.dart';
import 'package:virtualguide/view/master/history/components/search_history.dart';
import 'package:virtualguide/widgets/constant/constant.dart';

class HistoryListWidget extends StatelessWidget {
  final List<HistoryModel> searchData;
  final List<dynamic> historyData;
  const HistoryListWidget(
      {super.key, required this.historyData, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: VirtualGuide.padding*2),
          child: Image.asset(
            "assets/images/green_logo.png",
            height: 10,
          ),
        ),
        leadingWidth: 40,
        title: const Text(
          "History",
        ),
        actions: [
          SearchHistory(
            searchData: searchData,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: historyData.length,
        itemBuilder: (context, i) {
          return HistoryTile(
            slidableKey: historyData[i]['id'].toString(),
            historyModel: HistoryModel(
                id: int.parse(historyData[i]['id']),
                title: historyData[i]['title'],
                messages: historyData[i]['messages'],
                gptMessages: historyData[i]['gptMessages'],
                createdAt: historyData[i]['createdAt'],
                category: historyData[i]['category'],
                aiAssistantData: historyData[i]['aiAssistantData']
            ),
          );
        },
      ),
    );
  }
}

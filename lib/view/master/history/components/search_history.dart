import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:virtualguide/model/history/history.dart';
import 'package:virtualguide/view/master/history/components/history_tile.dart';

class SearchHistory extends StatelessWidget {
  final List<HistoryModel> searchData;
  const SearchHistory({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showSearch(
        context: context,
        delegate: SearchPage(
          onQueryUpdate: print,
          items: searchData,
          searchLabel: 'Search History',
          suggestion: const Center(
            child: Text('Filter history by title'),
          ),
          failure: const Center(
            child: Text('Not Found'),
          ),
          filter: (history) => [
            history.title,
          ],
          sort: (a, b) => a.compareTo(b),
          builder: (history) {
            return HistoryTile(
              slidableKey: "${history.title}_${history.id}",
              historyModel: HistoryModel(
                title: history.title,
                messages: history.messages,
                gptMessages: history.gptMessages,
                createdAt: history.createdAt,
                category: history.category,
                aiAssistantData: history.aiAssistantData,
              ),
            );
          },
        ),
      ),
      icon: const Icon(Icons.search),
    );
  }
}

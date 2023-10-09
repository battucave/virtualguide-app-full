import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/chat/chat_provider.dart';
import 'package:virtualguide/model/history/history.dart';
import 'package:virtualguide/view/master/chat/components/continue_draft_chat/continue_draft_chat.dart';
import 'package:virtualguide/widgets/common/formatter.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class HistoryTile extends StatelessWidget {
  final String slidableKey;
  final HistoryModel historyModel;
  const HistoryTile(
      {super.key, required this.slidableKey, required this.historyModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: VirtualGuide.padding * 1.5),
      child: Slidable(
        key: Key(slidableKey),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) =>
                  context.read<ChatProvider>().deleteHistory(
                        id: historyModel.id.toString(),
                        title: historyModel.title.toString(),
                        context: context,
                      ),
              backgroundColor: LightTheme.red,
              foregroundColor: LightTheme.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: VirtualGuide.padding + 5),
          child: Container(
            height: 70.0,
            decoration: BoxDecoration(
              color: AdaptiveTheme.of(context).mode.isLight
                  ? LightTheme.lightGreyColor300
                  : DarkTheme.darkGreyColor300,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              title: Text(
                historyModel.title.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                Formatter.formatDateTime(
                  dateTime: DateTime.parse(
                    historyModel.createdAt,
                  ),
                ),
                style: TextStyle(
                  fontSize: 12.0,
                  color: AdaptiveTheme.of(context).mode.isLight
                      ? LightTheme.lightGreyColor400
                      : DarkTheme.darkGreyColor400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContinueDraftChat(
                        id: historyModel.id.toString(),
                        title: historyModel.title,
                        aiAssistantData: historyModel.aiAssistantData,
                        historyModel: historyModel,
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

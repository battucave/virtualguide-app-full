import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/chat/chat_provider.dart';
import 'package:virtualguide/controller/user_service/user_service.dart';
import 'package:virtualguide/model/chat/message.dart';
import 'package:virtualguide/model/history/history.dart';
import 'package:virtualguide/view/master/chat/components/chat_messages.dart';
import 'package:virtualguide/view/master/chat/components/empty_chat_background.dart';
import 'package:virtualguide/view/master/chat/components/textfield_tile.dart';
import 'package:virtualguide/widgets/common/formatter.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/theme/dark_theme.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class DraftChatScreen extends StatefulWidget {
  final HistoryModel historyModel;
  final dynamic aiAssistantData;
  const DraftChatScreen(
      {super.key, required this.historyModel, required this.aiAssistantData});

  @override
  State<DraftChatScreen> createState() => _DraftChatScreenState();
}

class _DraftChatScreenState extends State<DraftChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatProvider>().messages = widget.historyModel.messages;
    context.read<ChatProvider>().gptMessages = widget.historyModel.gptMessages;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await backChecker(),
      child: Column(
        children: [
          Consumer<ChatProvider>(
            builder: (context, provider, child) {
              return Builder(
                builder: (context) {
                  if (provider.messages.isNotEmpty) {
                    return Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: provider.messages.length,
                          itemBuilder: (context, index) {
                            return ChatMessage(
                              message: Message(
                                text: provider.messages[index]['content'],
                                sender: provider.messages[index]['role'],
                                isMe: provider.messages[index]['isMe'],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const EmptyChatBackground();
                  }
                },
              );
            },
          ),
          Column(
            children: [
              Divider(
                height: 1.0,
                color: AdaptiveTheme.of(context).mode.isLight
                    ? LightTheme.lightGreyColor
                    : DarkTheme.darkGreyColor,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: VirtualGuide.padding+8,
                ),
                child: TextFieldTile.tileWidget(
                  controller: _controller,
                  onTap: () => _sendMessage(),
                  isTyping: context.read<ChatProvider>().isTyping,
                  category: widget.aiAssistantData['route'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Send Msg - request for GPT
  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    context.read<ChatProvider>().addMessages(
      text: _controller.text,
      sender: "user",
      isMe: true,
    );
    context.read<ChatProvider>().isTyping = true;
    _controller.clear();

    try {
      if (widget.aiAssistantData['route'] == VirtualGuide.writingAnArticles ||
          widget.aiAssistantData['route'] == VirtualGuide.academicWriter ||
          widget.aiAssistantData['route'] == VirtualGuide.summarize ||
          widget.aiAssistantData['route'] == VirtualGuide.songAndLyrics ||
          widget.aiAssistantData['route'] == VirtualGuide.storyteller ||
          widget.aiAssistantData['route'] == VirtualGuide.poems ||
          widget.aiAssistantData['route'] == VirtualGuide.movieScript ||
          widget.aiAssistantData['route'] == VirtualGuide.emailWriter ||
          widget.aiAssistantData['route'] == VirtualGuide.jobPost ||
          widget.aiAssistantData['route'] == VirtualGuide.advertisements ||
          widget.aiAssistantData['route'] == VirtualGuide.linkedin ||
          widget.aiAssistantData['route'] == VirtualGuide.instagram ||
          widget.aiAssistantData['route'] == VirtualGuide.twitter ||
          widget.aiAssistantData['route'] == VirtualGuide.facebook ||
          widget.aiAssistantData['route'] == VirtualGuide.birthday ||
          widget.aiAssistantData['route'] == VirtualGuide.apology ||
          widget.aiAssistantData['route'] == VirtualGuide.invitation ||
          widget.aiAssistantData['route'] == VirtualGuide.tellAJoke ||
          widget.aiAssistantData['route'] == VirtualGuide.foodRecipes ||
          widget.aiAssistantData['route'] == VirtualGuide.dietPlan ||
          widget.aiAssistantData['route'] == VirtualGuide.grammarCorrection ||
          widget.aiAssistantData['route'] == VirtualGuide.interviewQuestions ||
          widget.aiAssistantData['route'] == VirtualGuide.writeCode) {
        String response = await UserService.generationWithGPT(
          context: context,
          message: context.read<ChatProvider>().gptMessages.last['content'],
          prompt: widget.aiAssistantData['prompt'],
          model: widget.aiAssistantData['model'],
          maxTokens: widget.aiAssistantData['max_tokens'],
        );
        insertNewData(response);
      } else if (widget.aiAssistantData['route'] == VirtualGuide.explainCode) {
        String response = await UserService.explainCodeWithGPT(
          context: context,
          message: context.read<ChatProvider>().gptMessages.last['content'],
          prompt: widget.aiAssistantData['prompt'],
          model: widget.aiAssistantData['model'],
          maxTokens: widget.aiAssistantData['max_tokens'],
        );
        insertNewData(response);
      } else {
        String response = await UserService.chatWithGPT(
          context: context,
          message: context.read<ChatProvider>().gptMessages,
        );
        insertNewData(response);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          context.read<ChatProvider>().isTyping = false;
        }
      }
    }
  }

  // Response Msg - response for GPT
  void insertNewData(String response) {
    context
        .read<ChatProvider>()
        .addMessages(text: response, sender: "system", isMe: false);
    context.read<ChatProvider>().isTyping = false;
  }

  // Back Restriction And Save Data Into Database
  Future<bool> backChecker() {
    if (context.read<ChatProvider>().isTyping) {
      return Future.value(false);
    } else {
      if (context.read<ChatProvider>().messages.isNotEmpty) {
        context.read<ChatProvider>().updateDatabase(
          context: context,
          title: Formatter.generateTitle(
            title: context.read<ChatProvider>().messages[
            context.read<ChatProvider>().messages.length - 1]
            ['content'],
          ),
          id: widget.historyModel.id.toString(),
          category: widget.aiAssistantData['route'],
          aiAssistantData: widget.aiAssistantData,
        );
      }else {
        return Future.value(true);
      }
      return Future.value(false);
    }
  }
}

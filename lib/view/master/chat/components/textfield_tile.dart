import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualguide/controller/provider/chat/chat_provider.dart';
import 'package:virtualguide/view/master/chat/components/custom_textfield.dart';
import 'package:virtualguide/widgets/constant/constant.dart';
import 'package:virtualguide/widgets/constant/loader/spinkit.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class TextFieldTile {
  static Widget tileWidget(
      {required TextEditingController controller,
      required VoidCallback onTap,
      required bool isTyping,
      required String category}) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            onTap: onTap,
            textEditingController: controller,
            category: category,
          ),
        ),
        const SizedBox(
          width: VirtualGuide.width+5,
        ),
        Consumer<ChatProvider>(
          builder: (context, provider, child) {
            return InkWell(
              onTap: provider.isTyping
                  ? () => provider.stopChatGenerating()
                  : onTap,
              child: CircleAvatar(
                backgroundColor: LightTheme.primaryColor,
                child: provider.isTyping
                    ? Spinkit.spinkit
                    : Icon(
                        Icons.send,
                        size: 15.0,
                        color: LightTheme.whiteColor,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}

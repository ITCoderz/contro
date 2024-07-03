import 'package:contro/models/chat_model/messages_model.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/colors/app_colors.dart';

class ClientMessageBubble extends StatelessWidget {
  final MessagesModel messagesModel;

  const ClientMessageBubble({
    super.key,
    required this.messagesModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Image.asset(
              messagesModel.image,
              height: 30,
            ),
          ),
          10.pw,
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.width * 0.7,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: CColors.whiteColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: messagesModel.messageType == "isVoice"
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.iconsSpeakerIcon,
                          height: 10,
                        ),
                        5.pw,
                        Text(
                          messagesModel.messages,
                          style: CustomTextStyles.darkGreyColor410,
                        ),
                      ],
                    )
                  : messagesModel.messageType == "isImage"
                      ? Image.asset(
                          messagesModel.messages,
                          height: 100,
                        )
                      : Text(
                          messagesModel.messages,
                          style: CustomTextStyles.darkGreyColor414,
                        ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserMessageBubble extends StatelessWidget {
  final MessagesModel messagesModel;

  const UserMessageBubble({
    super.key,
    required this.messagesModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.width * 0.7,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: CColors.purpleAccentColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: messagesModel.messageType == "isVoice"
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.iconsSpeakerIcon,
                          height: 10,
                        ),
                        5.pw,
                        Text(
                          messagesModel.messages,
                          style: CustomTextStyles.white414,
                        ),
                      ],
                    )
                  : messagesModel.messageType == "isImage"
                      ? Image.asset(
                          messagesModel.messages,
                          height: 100,
                        )
                      : Text(
                          messagesModel.messages,
                          style: CustomTextStyles.white414,
                        ),
            ),
          ),
          10.pw,
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: CColors.purpleAccentColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                Assets.iconsControMessageIcon,
                height: 20,
              ),
            ),
          ),
        ],
      ).alignWidget(
        alignment: Alignment.centerRight,
      ),
    );
  }
}

import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../models/chat_model/chat_model.dart';
import '../../../../../utils/colors/app_colors.dart';

class ChatLandingBubble extends StatelessWidget {
  final ChatModel chatModel;
  final Function()? onTapFunction;

  const ChatLandingBubble({
    super.key,
    required this.chatModel,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTapFunction,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: chatModel.name == "Contro"
                ? CColors.greyColor
                : CColors.whiteColor,
            border: const Border(
              bottom: BorderSide(color: CColors.borderOneColor),
            ),
          ),
          child: Row(
            children: [
              chatModel.name == "Contro" ||
                      chatModel.name == "Service Announcement"
                  ? Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: chatModel.name == "Contro"
                            ? CColors.purpleAccentColor
                            : CColors.yellowColor,
                      ),
                      child: SvgPicture.asset(chatModel.image),
                    )
                  : Image.asset(
                      chatModel.image,
                      height: 50,
                      width: 50,
                    ),
              10.pw,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            chatModel.name,
                            style: CustomTextStyles.darkGreyColor514,
                          ),
                        ),
                        Text(
                          chatModel.time,
                          style: chatModel.name == "Contro"
                              ? CustomTextStyles.darkGreyColor410
                              : CustomTextStyles.greyTwoColor410,
                        ),
                      ],
                    ),
                    Text(
                      chatModel.message,
                      style: TextStyle(
                        color: chatModel.name == "Contro"
                            ? CColors.darkGreyColor
                            : CColors.greyTwoColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
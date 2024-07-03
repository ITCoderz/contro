import 'package:contro/models/chat_model/chat_model.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/constants/constant_lists.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../components/messages_components.dart';
import '../controller/messages_controller.dart';

class MessagesScreen extends StatelessWidget {
  final ChatModel chatModel;

  const MessagesScreen({
    super.key,
    required this.chatModel,
  });

  @override
  Widget build(BuildContext context) {
    final messagesController = Get.find<MessagesController>();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                Row(
                  children: [
                    5.pw,
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 17,
                        color: CColors.darkGreyColor,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            chatModel.image,
                            height: 32,
                            width: 32,
                          ),
                          10.pw,
                          Expanded(
                            child: Text(
                              chatModel.name,
                              style: CustomTextStyles.darkGreyColor518,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                20.ph,
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    itemCount: ConstantLists.messagesList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        20.ph,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child:
                                ConstantLists.messagesList[index].isUserMessage
                                    ? ClientMessageBubble(
                                        messagesModel:
                                            ConstantLists.messagesList[index],
                                      )
                                    : UserMessageBubble(
                                        messagesModel:
                                            ConstantLists.messagesList[index],
                                      ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                BottomAppBar(
                  color: CColors.whiteColor,
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: SvgPicture.asset(
                          Assets.iconsMessageAddAttachment,
                          height: 20,
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: CustomTextField(
                          textEditingController:
                              messagesController.messageTextController,
                          borderColor: CColors.greyTwoColor,
                          borderRadius: 8,
                        ),
                      ),
                      10.pw,
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: SvgPicture.asset(
                          Assets.iconsMessageCameraIcon,
                          height: 20,
                        ),
                      ),
                      10.pw,
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: SvgPicture.asset(
                          Assets.iconsMessageRecordIcon,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

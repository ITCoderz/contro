import 'package:contro/reusable_widgets/custom_text_fields/message_text_field.dart';
import 'package:contro/utils/constants/constant_lists.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import '../../messages_screen/view/messages_screen.dart';
import '../component/chat_landing_components.dart';
import '../controller/chat_landing_controller.dart';

class ChatLandingScreen extends StatelessWidget {
  const ChatLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatLandingController = Get.find<ChatLandingController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          height: context.height,
          width: context.width,
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                const Text(
                  "Contro Chat.",
                  style: CustomTextStyles.darkGreyColor622,
                ),
                20.ph,
                Row(
                  children: [
                    Expanded(
                      child: MessageTextField(
                        textEditingController:
                            chatLandingController.searchTextController,
                        hintText: "Search",
                      ),
                    ),
                    10.pw,
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        Assets.iconsMessagesCirclePlus,
                      ),
                    ),
                  ],
                ),
                20.ph,
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ConstantLists.chatList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: ChatLandingBubble(
                              chatModel: ConstantLists.chatList[index],
                              onTapFunction: () {
                                  Get.to(
                                      () => MessagesScreen(
                                            chatModel:
                                                ConstantLists.chatList[index],
                                          ),
                                      transition: Transition.fadeIn);

                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(
        selectedIndex: 1,
      ),
    );
  }
}

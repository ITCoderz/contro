import 'package:contro/reusable_widgets/custom_text_fields/message_text_field.dart';
import 'package:contro/screen/home/item/add_location/component/add_location_component.dart';
import 'package:contro/screen/home/item/add_location/controller/add_location_controller.dart';
import 'package:contro/utils/constants/constant_lists.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/app_colors.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addLocationController = Get.find<AddLocationController>();
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
                Row(
                  children: [
                    Expanded(
                      child: MessageTextField(
                        textEditingController:
                            addLocationController.searchLocationController,
                        hintText: "Search Location",
                      ),
                    ),
                    10.pw,
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        "Cancel",
                        style: CustomTextStyles.darkGreyColor414,
                      ),
                    )
                  ],
                ),
                10.ph,
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CColors.darkGreyColor,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "To find nearby places, please turn on location services.",
                          style: CustomTextStyles.white412,
                        ),
                      ),
                      15.pw,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            fixedSize: const Size(80, 33),
                            padding: EdgeInsets.zero,
                            backgroundColor: CColors.redAccentColor),
                        child: const Text(
                          "Turn On",
                          style: CustomTextStyles.white412,
                        ),
                      ),
                    ],
                  ),
                ),
                15.ph,
                Obx(() {
                  return Row(
                    children: [
                      Expanded(
                        child: CustomTabComponent(
                          title: "For you",
                          isSelected:
                              addLocationController.selectedIndex.value == 0,
                          onTapFunction: () {
                            addLocationController.toggleSelectedIndex(index: 0);
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTabComponent(
                          title: "Browse",
                          isSelected:
                              addLocationController.selectedIndex.value == 1,
                          onTapFunction: () {
                            addLocationController.toggleSelectedIndex(index: 1);
                          },
                        ),
                      ),
                    ],
                  );
                }),
                10.ph,
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: ConstantLists.locationList.length,
                    separatorBuilder: (context, index) => 12.ph,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: AddLocationComponent(
                              onTapFunction: () {},
                              pickUpLocationModel:
                                  ConstantLists.locationList[index],
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
    );
  }
}

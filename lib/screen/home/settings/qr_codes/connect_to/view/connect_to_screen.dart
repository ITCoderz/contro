import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../models/category_selection_model/category_selection_model.dart';
import '../../../../../../reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../controller/connect_to_controller.dart';

class ConnectToScreen extends StatelessWidget {
  const ConnectToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final connectToController = Get.find<ConnectToController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                        color: CColors.greyTwoColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                5.ph,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: CColors.darkGreyColor,
                      ),
                    ),
                    5.pw,
                    const Text(
                      "Connect.",
                      style: CustomTextStyles.darkGreyColor620,
                    ),
                  ],
                ).alignWidget(
                  alignment: Alignment.centerLeft,
                ),
                15.ph,
                CategorySelectionTile(
                  onTapFunction: () {},
                  categorySelectionModel: CategorySelectionModel(
                    iconString: Assets.iconsControConnectIcon,
                    title: "Instant App",
                  ),
                  borderRadius: 8,
                ),
                10.ph,
                CategorySelectionTile(
                  onTapFunction: () {},
                  categorySelectionModel: CategorySelectionModel(
                    iconString: Assets.iconsProductConnectIcon,
                    title: "Product",
                  ),
                  borderRadius: 8,
                ),
                10.ph,
                CategorySelectionTile(
                  onTapFunction: () {},
                  categorySelectionModel: CategorySelectionModel(
                    iconString: Assets.iconsServiceConnectIcon,
                    title: "Service",
                  ),
                  borderRadius: 8,
                ),
                10.ph,
                CategorySelectionTile(
                  onTapFunction: () {},
                  categorySelectionModel: CategorySelectionModel(
                    iconString: Assets.iconsMapPinConnect,
                    title: "Location",
                  ),
                  borderRadius: 8,
                ),
                10.ph,
                CategorySelectionTile(
                  onTapFunction: () {},
                  categorySelectionModel: CategorySelectionModel(
                    iconString: Assets.iconsChatConnectIcon,
                    title: "Chat",
                  ),
                  borderRadius: 8,
                ),
                10.ph,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 68,
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        decoration: const BoxDecoration(
          color: CColors.whiteColor,
        ),
        child: CustomElevatedButton(
          buttonText: "Cancel",
          backgroundColor: CColors.darkGreyColor,
          onPressedFunction: () {
            Get.back();
          },
          needShadow: false,
        ),
      ),
    );
  }
}

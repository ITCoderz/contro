import 'package:contro/reusable_widgets/custom_dialogs/delete_dialog.dart';
import 'package:contro/screen/home/item/add_location/view/add_location_screen.dart';
import 'package:contro/screen/home/item/set_pick_up_delivery/components/set_pick_up_delivery_components.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/constants/constant_lists.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../controller/set_pick_up_delivery_controller.dart';

class SetPickUpDeliveryScreen extends StatelessWidget {
  const SetPickUpDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final setPickUpDeliveryController = Get.find<SetPickUpDeliveryController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    10.ph,
                    const CustomBackTitle(
                      title: "Set Pick-up & Delivery",
                      hasCrossIcon: true,
                    ),
                    20.ph,
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          SetPickUpDeliveryComponents(
                            assetIcon: Assets.iconsTruckIcon,
                            title: "Domestic Delivery",
                            status: false,
                            onChangedFunction: (val) {},
                          ),
                          10.ph,
                          SetPickUpDeliveryComponents(
                            assetIcon: Assets.iconsAeroplaneIcon,
                            title: "International Shipping",
                            status: false,
                            onChangedFunction: (val) {},
                          ),
                          10.ph,
                          SetPickUpDeliveryComponents(
                            assetIcon: Assets.iconsHandStop,
                            title: "Pick-Up",
                            status: false,
                            onChangedFunction: (val) {},
                          ),
                        ],
                      ),
                    ),
                    10.ph,
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CColors.whiteColor,
                      ),
                      child: Obx(
                        () {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Pick-up Location",
                                    style: CustomTextStyles.darkGreyColor414,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setPickUpDeliveryController
                                          .toggleEditing();
                                    },
                                    child: Text(
                                      setPickUpDeliveryController
                                              .isEditing.value
                                          ? "Done"
                                          : "Edit",
                                      style: CustomTextStyles.blueTwoColor414,
                                    ),
                                  )
                                ],
                              ),
                              20.ph,
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: ConstantLists
                                    .pickUpLocationModelList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) => 10.ph,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: PickUpLocationWidget(
                                          title: ConstantLists
                                              .pickUpLocationModelList[index]
                                              .title,
                                          description: ConstantLists
                                              .pickUpLocationModelList[index]
                                              .description,
                                          isEditing: setPickUpDeliveryController
                                              .isEditing.value,
                                          removeFunction: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  DeleteDialog(
                                                onPressedFunction: () {
                                                  Get.back();
                                                },
                                                isForAddress: true,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    10.ph,
                    Obx(() {
                      return Visibility(
                        visible: setPickUpDeliveryController.isEditing.value,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => const AddLocationScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: const BoxDecoration(
                                color: CColors.whiteColor,
                              ),
                              width: context.width,
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.iconsAddBankIcon,
                                      width: 33,
                                    ),
                                    10.pw,
                                    const Expanded(
                                      child: Text(
                                        "Add Location",
                                        style:
                                            CustomTextStyles.darkGreyColor414,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
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
          border: Border(
            top: BorderSide(
              color: CColors.lightGreyColor,
            ),
          ),
        ),
        child: Obx(() {
          return CustomElevatedButton(
            onPressedFunction: () {
              Get.back();
            },
            buttonText: "Done",
            needShadow: false,
            textStyle: setPickUpDeliveryController.isEditing.value
                ? CustomTextStyles.greyTwoColor414
                : CustomTextStyles.white414,
            backgroundColor: setPickUpDeliveryController.isEditing.value
                ? CColors.lightGreyColor
                : CColors.purpleAccentColor,
          );
        }),
      ),
    );
  }
}

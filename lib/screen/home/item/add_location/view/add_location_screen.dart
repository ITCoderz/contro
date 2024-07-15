import 'package:contro/reusable_widgets/custom_background_container.dart';
import 'package:contro/screen/home/item/add_location/controller/add_location_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addLocationController = Get.find<AddLocationController>();
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
                      title: "Add Address.",
                    ),
                    20.ph,
                    CustomBackgroundContainer(
                      leftPadding: 10,
                      rightPadding: 10,
                      topPadding: 15,
                      bottomPadding: 15,
                      radius: 0,
                      width: context.width,
                      childWidget: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Contact Person Name",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController: addLocationController
                                .contactPersonNameController,
                            hintText: "Name",
                            borderRadius: 6,
                          ),
                          20.ph,
                          const Text(
                            "Contact Number",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController:
                                addLocationController.contactNumberController,
                            hintText: "Mobile",
                            borderRadius: 6,
                          ),
                          20.ph,
                          const Text(
                            "Address",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController:
                                addLocationController.buildingNameController,
                            hintText: "Building Name (Optional)",
                            borderRadius: 6,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController:
                                addLocationController.unitNumberController,
                            hintText: "Unit Number",
                            borderRadius: 6,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController:
                                addLocationController.streetNameController,
                            hintText: "Street Name",
                            borderRadius: 6,
                          ),
                          10.ph,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  textEditingController:
                                      addLocationController.cityController,
                                  hintText: "City",
                                  borderRadius: 6,
                                ),
                              ),
                              10.pw,
                              Expanded(
                                child: CustomTextField(
                                  textEditingController:
                                      addLocationController.postCodeController,
                                  hintText: "Postcode",
                                  borderRadius: 6,
                                ),
                              ),
                            ],
                          ),
                          10.ph,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  textEditingController:
                                      addLocationController.stateController,
                                  hintText: "State",
                                  borderRadius: 6,
                                ),
                              ),
                              10.pw,
                              Expanded(
                                child: CustomTextField(
                                  textEditingController:
                                      addLocationController.countryController,
                                  hintText: "Country",
                                  borderRadius: 6,
                                ),
                              ),
                            ],
                          ),
                          20.ph,
                        ],
                      ),
                    ),
                    10.ph,
                    CustomBackgroundContainer(
                      leftPadding: 10,
                      rightPadding: 10,
                      topPadding: 15,
                      bottomPadding: 15,
                      radius: 0,
                      width: context.width,
                      childWidget: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Label As",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController:
                                addLocationController.labelNameController,
                            hintText: "Label Name",
                            borderRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    40.ph,
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
        child: CustomElevatedButton(
          onPressedFunction: () {
            Get.back();
          },
          buttonText: "Save Address",
          needShadow: false,
          textStyle: CustomTextStyles.white414,
          backgroundColor: CColors.purpleAccentColor,
        ),
      ),
    );
  }
}

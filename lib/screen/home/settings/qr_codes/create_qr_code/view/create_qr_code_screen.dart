import 'package:contro/screen/home/settings/qr_codes/create_qr_code/controller/create_qr_code_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../../reusable_widgets/custom_background_container.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../connect_to/view/connect_to_screen.dart';

class CreateQrCodeScreen extends StatelessWidget {
  const CreateQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final createQrCodeController = Get.find<CreateQrCodeController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
                          "Create QR Code..",
                          style: CustomTextStyles.darkGreyColor620,
                        ),
                      ],
                    ).alignWidget(
                      alignment: Alignment.centerLeft,
                    ),
                    15.ph,
                    TitleContainerWidget(
                      titleString: "QR Code Name",
                      childWidget: CustomTextField(
                        textEditingController:
                            createQrCodeController.qrCodeNameController,
                        hintText: "Enter QR Code Name",
                      ),
                    ),
                    10.ph,
                    TitleContainerWidget(
                      titleString: "Connect to",
                      childWidget: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => const ConnectToScreen(),
                                transition: Transition.downToUp,
                              );
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                color: CColors.scaffoldColor,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  color: CColors.borderOneColor,
                                  width: 0.5,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Instant App",
                                    style: CustomTextStyles.darkGreyColor412,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: CColors.darkGreyColor,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.ph,
                    TitleContainerWidget(
                      titleString: "Date Created",
                      childWidget: CustomTextField(
                        textEditingController:
                            createQrCodeController.dateControllerController,
                        hintText: "Select Date",
                        readOnly: true,
                        onTap: () {
                          createQrCodeController.selectDate(context: context);
                        },
                      ),
                    ),
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
          buttonText: "Done",
          onPressedFunction: () {
            Get.back();
          },
          needShadow: false,
        ),
      ),
    );
  }
}

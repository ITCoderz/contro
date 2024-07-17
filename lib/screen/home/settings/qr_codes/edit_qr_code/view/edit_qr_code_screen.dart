import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../models/category_selection_model/category_selection_model.dart';
import '../../../../../../models/qr_codes_model/qr_code_model.dart';
import '../../../../../../reusable_widgets/custom_background_container.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../create_qr_code/components/create_qr_code_components.dart';
import '../controller/edit_qr_code_controller.dart';

class EditQrCodeScreen extends StatefulWidget {
  final QrCodesModel qrCodesModel;

  const EditQrCodeScreen({
    super.key,
    required this.qrCodesModel,
  });

  @override
  State<EditQrCodeScreen> createState() => _EditQrCodeScreenState();
}

class _EditQrCodeScreenState extends State<EditQrCodeScreen> {
  final editQrCodeController = Get.find<EditQrCodeController>();

  @override
  void initState() {
    editQrCodeController.initializeVariables(
      qrCodesModel: widget.qrCodesModel,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    10.ph,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            color: CColors.darkGreyColor,
                          ),
                        ),
                        10.pw,
                        const Text(
                          "Edit QR Code.",
                          style: CustomTextStyles.darkGreyColor618,
                        ),
                      ],
                    ).alignWidget(
                      alignment: Alignment.centerLeft,
                    ),
                    15.ph,
                    CustomBackgroundContainer(
                      radius: 0,
                      topPadding: 15,
                      bottomPadding: 15,
                      leftPadding: 10,
                      rightPadding: 10,
                      childWidget: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "QR Code Name",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController:
                                editQrCodeController.qrCodeNameController,
                            hintText: "Enter QR Code Name",
                            borderRadius: 6,
                          ),
                          20.ph,
                          const Text(
                            "Connect to",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  // Get.to(
                                  //   () => const ConnectToScreen(),
                                  //   transition: Transition.downToUp,
                                  // );
                                  showModalBottomSheet(
                                    elevation: 0.0,
                                    backgroundColor: CColors.whiteColor,
                                    enableDrag: true,
                                    // showDragHandle: true,
                                    isScrollControlled: true,
                                    // constraints:
                                    //     BoxConstraints(maxHeight: context.height * 0.8),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.zero,
                                        bottomRight: Radius.zero,
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            10.ph,
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: const Icon(
                                                    Icons.close_rounded,
                                                    color:
                                                        CColors.darkGreyColor,
                                                  ),
                                                ),
                                                const Text(
                                                  "Connect.",
                                                  style: CustomTextStyles
                                                      .darkGreyColor620,
                                                ),
                                              ],
                                            ).alignWidget(
                                              alignment: Alignment.centerLeft,
                                            ),
                                            10.ph,
                                            ConnectToTile(
                                              onTapFunction: () {
                                                editQrCodeController
                                                    .changeConnectToString(
                                                        value: "Instant App");
                                                Get.back();
                                              },
                                              categorySelectionModel:
                                                  CategorySelectionModel(
                                                iconString: Assets
                                                    .iconsControConnectIcon,
                                                title: "Instant App",
                                              ),
                                              borderRadius: 8,
                                            ),
                                            10.ph,
                                            ConnectToTile(
                                              onTapFunction: () {
                                                editQrCodeController
                                                    .changeConnectToString(
                                                        value: "Product");
                                                Get.back();
                                              },
                                              categorySelectionModel:
                                                  CategorySelectionModel(
                                                iconString: Assets
                                                    .iconsProductConnectIcon,
                                                title: "Product",
                                              ),
                                              borderRadius: 8,
                                            ),
                                            10.ph,
                                            ConnectToTile(
                                              onTapFunction: () {
                                                editQrCodeController
                                                    .changeConnectToString(
                                                        value: "Service");
                                                Get.back();
                                              },
                                              categorySelectionModel:
                                                  CategorySelectionModel(
                                                iconString: Assets
                                                    .iconsServiceConnectIcon,
                                                title: "Service",
                                              ),
                                              borderRadius: 8,
                                            ),
                                            10.ph,
                                            ConnectToTile(
                                              onTapFunction: () {
                                                editQrCodeController
                                                    .changeConnectToString(
                                                        value: "Location");
                                                Get.back();
                                              },
                                              categorySelectionModel:
                                                  CategorySelectionModel(
                                                iconString:
                                                    Assets.iconsMapPinConnect,
                                                title: "Location",
                                              ),
                                              borderRadius: 8,
                                            ),
                                            10.ph,
                                            ConnectToTile(
                                              onTapFunction: () {
                                                editQrCodeController
                                                    .changeConnectToString(
                                                        value: "Chat");
                                                Get.back();
                                              },
                                              categorySelectionModel:
                                                  CategorySelectionModel(
                                                iconString:
                                                    Assets.iconsChatConnectIcon,
                                                title: "Chat",
                                              ),
                                              borderRadius: 8,
                                            ),
                                            30.ph,
                                            CustomElevatedButton(
                                              buttonText: "Cancel",
                                              backgroundColor:
                                                  CColors.darkGreyColor,
                                              onPressedFunction: () {
                                                Get.back();
                                              },
                                              needShadow: false,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: CColors.scaffoldColor,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: CColors.borderOneColor,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() {
                                        return Text(
                                          editQrCodeController
                                              .connectToString.value,
                                          style:
                                              CustomTextStyles.darkGreyColor412,
                                        );
                                      }),
                                      const Icon(
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
                          20.ph,
                          const Text(
                            "Date Created",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController:
                                editQrCodeController.dateControllerController,
                            hintText: "Select Date",
                            readOnly: true,
                            fillColor: CColors.scaffoldColor,
                            onTap: () {
                              // createQrCodeController.selectDate(
                              //     context: context);
                            },
                            borderRadius: 6,
                          ),
                        ],
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
          buttonText: "Update QR Code",
          onPressedFunction: () {
            Get.back();
          },
          needShadow: false,
        ),
      ),
    );
  }
}

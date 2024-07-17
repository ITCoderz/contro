import 'package:contro/screen/home/settings/wallet/edit_bank/controller/edit_bank_account_controller.dart';
import 'package:contro/utils/colors/app_colors.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../../models/bank_account_model/bank_account_model.dart';
import '../../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../../reusable_widgets/custom_background_container.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_formatter.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../../utils/text_styles/text_styles.dart';

class EditBankAccountScreen extends StatefulWidget {
  final BankAccountModel bankAccountModel;

  const EditBankAccountScreen({
    super.key,
    required this.bankAccountModel,
  });

  @override
  State<EditBankAccountScreen> createState() => _EditBankAccountScreenState();
}

class _EditBankAccountScreenState extends State<EditBankAccountScreen> {
  final editBankAccountController = Get.find<EditBankAccountController>();

  @override
  void initState() {
    editBankAccountController.initializeBankAccountModel(
      bankAccountModel: widget.bankAccountModel,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              title: "Edit Bank Account",
                              hasCrossIcon: true,
                            ),
                            20.ph,
                            CustomBackgroundContainer(
                              leftPadding: 10,
                              rightPadding: 10,
                              radius: 0,
                              childWidget: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Bank",
                                    style: CustomTextStyles.darkGreyColor412,
                                  ),
                                  10.ph,
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Ink(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            top: 5,
                                            bottom: 5,
                                            right: 5,
                                          ),
                                          height: 42,
                                          decoration: BoxDecoration(
                                            color: CColors.scaffoldColor,
                                            border: Border.all(
                                              color: CColors.borderOneColor,
                                              width: 0.5,
                                            ),
                                          ),
                                          width: context.width,
                                          child: Center(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        widget.bankAccountModel
                                                            .assetImage,
                                                        height: 25,
                                                      ),
                                                      5.pw,
                                                      Text(
                                                        widget.bankAccountModel
                                                            .bankName,
                                                        style: CustomTextStyles
                                                            .darkGreyColor412,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                10.pw,
                                                const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                                  20.ph,
                                  const Text(
                                    "Account Name",
                                    style: CustomTextStyles.darkGreyColor412,
                                  ),
                                  10.ph,
                                  CustomTextField(
                                    textEditingController:
                                        editBankAccountController
                                            .accountNameController,
                                    hintText: "Enter Account Name",
                                    borderRadius: 6,
                                  ),
                                  20.ph,
                                  const Text(
                                    "Account Number",
                                    style: CustomTextStyles.darkGreyColor412,
                                  ),
                                  10.ph,
                                  CustomTextField(
                                    textEditingController:
                                        editBankAccountController
                                            .accountNumberController,
                                    hintText: "Enter Account Number",
                                    borderRadius: 6,
                                    inputFormatters: [
                                      MaskedTextInputFormatter(
                                          mask: "xxxx xxxx xxxx xxxx",
                                          separator: " "),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            10.ph,
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                    const Spacer(),
                    10.ph,
                    CustomElevatedButton(
                      onPressedFunction: () {
                        Get.back();
                      },
                      buttonText: "Update Bank Account",
                      needShadow: false,
                      textStyle: CustomTextStyles.white414,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

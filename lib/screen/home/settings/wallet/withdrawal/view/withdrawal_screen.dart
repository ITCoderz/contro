import 'package:contro/reusable_widgets/custom_background_container.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../bank_account/view/bank_account_screen.dart';
import '../controller/withdrawal_controller.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final withdrawalController = Get.find<WithdrawalController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
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
                            5.ph,
                            const CustomBackTitle(
                              title: "Withdrawal",
                            ),
                            20.ph,
                            TitleContainerWidget(
                              titleString: "Withdrawal Amount (RM)",
                              childWidget: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    textEditingController: withdrawalController
                                        .withdrawalAmountTextController,
                                    hintText: "0.00",
                                    keyboardType: TextInputType.number,
                                    needSuffix: true,
                                    suffixWidget: const Text(
                                      "Max",
                                      style: CustomTextStyles.blueTwoColor512,
                                    ),
                                  ),
                                  5.ph,
                                  const Text(
                                    "Available Balance : RM 888,000.00",
                                    style: CustomTextStyles.greyTwoColor412,
                                  ),
                                ],
                              ),
                            ),
                            10.ph,
                            TitleContainerWidget(
                              titleString: "Bank Details",
                              childWidget: ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => const BankAccountScreen(),
                                          transition: Transition.fadeIn);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        bottom: 5,
                                        right: 5
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
                                      child: const Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Maybank Berhad (Account No: ********2098)",
                                                style: CustomTextStyles
                                                    .darkGreyColor412,
                                              ),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                    const Spacer(),
                    10.ph,
                    CustomElevatedButton(
                      onPressedFunction: () {},
                      buttonText: "Withdraw",
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

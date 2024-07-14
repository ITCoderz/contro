import 'package:contro/screen/home/settings/wallet/bank_account/controller/bank_account_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/custom_dialogs/delete_dialog.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/constants/constant_lists.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../add_bank_account/view/add_bank_account_screen.dart';
import '../../edit_bank/view/edit_bank_account_screen.dart';
import '../component/bank_account_components.dart';

class BankAccountScreen extends StatelessWidget {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bankAccountController = Get.find<BankAccountController>();
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
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const CustomBackTitle(
                      title: "Bank Account",
                      hasCrossIcon: true,
                    ),
                    20.ph,
                    AnimationLimiter(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ConstantLists.bankAccountModelList.length,
                        separatorBuilder: (context, index) => 15.ph,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: BankAccountComponents(
                                  valueKey: index,
                                  bankAccountModel:
                                      ConstantLists.bankAccountModelList[index],
                                  onTapFunction: () {},
                                  editFunction: (context) {
                                    Get.to(
                                      () => EditBankAccountScreen(
                                        bankAccountModel: ConstantLists
                                            .bankAccountModelList[index],
                                      ),
                                      transition: Transition.fadeIn,
                                    );
                                  },
                                  deleteFunction: (context) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteDialog(
                                        onPressedFunction: () {
                                          Get.back();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    15.ph,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => const AddBankAccountScreen(),
                              transition: Transition.fadeIn,
                            );
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
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
                                      "Add Bank Account",
                                      style: CustomTextStyles.darkGreyColor414,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    CustomElevatedButton(
                      onPressedFunction: () {
                        Get.back();
                      },
                      buttonText: "Cancel",
                      needShadow: false,
                      textStyle: CustomTextStyles.white414,
                      backgroundColor: CColors.darkGreyColor,
                    ),
                    20.ph,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../../../../generated/assets.dart';
import '../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../reusable_widgets/custom_text_fields/custom_auth_field.dart';
import '../../../../utils/colors/app_colors.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: SizedBox()),
                    Center(
                      child: Image.asset(
                        Assets.iconsControAuthIcon,
                        height: 120,
                        width: 120,
                      ),
                    ),
                     const Text(
                      "Verify your mobile number.",
                      style: CustomTextStyles.darkGreyColor522,
                      textAlign: TextAlign.left,
                    ),
                    10.ph,
                    const Text(
                      'Tap "Continue" to get One Time Password (OTP) on this mobile number.',
                      style: CustomTextStyles.darkGreyColor314,
                      textAlign: TextAlign.left,
                    ),
                    20.ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: CColors.whiteColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: CountryCodePicker(
                            onChanged: (countryCode) {
                              loginController.changeCountryCode(
                                dialCode: countryCode.dialCode!,
                              );
                            },
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            showDropDownButton: true,
                            showFlagMain: false,
                            textStyle: CustomTextStyles.darkGreyColor412,
                            flagWidth: 25,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        10.pw,
                        Expanded(
                          child: AuthTextField(
                            textEditingController:
                                loginController.phoneTextController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.ph,
                    Center(
                      child: CustomElevatedButton(
                        onPressedFunction: () {
                          loginController.validate();
                        },
                        buttonText: "Continue",
                      ),
                    ),
                    10.ph,
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "By joining Contro you agree our\n",
                              style: CustomTextStyles.darkGreyColor311,
                            ),
                            TextSpan(
                              text: "Terms & Conditions.",
                              style: CustomTextStyles.blue412,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => debugPrint('Terms & Conditions.'),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    75.ph,
                    const Expanded(child: SizedBox()),
                    const Center(
                      child: Text(
                        "contro",
                        style: CustomTextStyles.darkGreyColorColorPoppins420,
                      ),
                    ),
                    5.ph,
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

import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/reusable_widgets/custom_text_fields/custom_pin_field.dart';
import 'package:contro/screen/auth/verify_otp/controller/verify_otp_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/assets.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String completeNumber;

  const VerifyOtpScreen({
    super.key,
    required this.completeNumber,
  });

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final verifyOtpController = Get.find<VerifyOtpController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    const Spacer(),
                    Image.asset(
                      Assets.iconsControAuthIcon,
                      height: 120,
                      width: 120,
                    ),
                    const Text(
                      "Verify your OTP Code.",
                      style: CustomTextStyles.darkGreyColor520,
                      textAlign: TextAlign.center,
                    ),
                    10.ph,
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text:
                                "Enter the One Time Password (OTP) code from the sms we sent to ",
                            style: CustomTextStyles.darkGreyColor313,
                          ),
                          TextSpan(
                            text: widget.completeNumber,
                            style: CustomTextStyles.blue513,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    20.ph,
                    CustomPinField(
                      pinController: verifyOtpController.enterPinController,
                      validatorFunction: (val) {
                        return null;
                      },
                    ),
                    20.ph,
                    CustomElevatedButton(
                      onPressedFunction: () {
                        verifyOtpController.validateOtp();
                      },
                      buttonText: "Continue",
                    ),
                    10.ph,
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Don't receive the OTP? ",
                            style: CustomTextStyles.darkGreyColor311,
                          ),
                          TextSpan(
                            text: "RESEND",
                            style: CustomTextStyles.blue412,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => debugPrint('RESEND'),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    60.ph,
                    const Spacer(
                      flex: 2,
                    ),
                    // const Text(
                    //   "contro",
                    //   style: CustomTextStyles.darkGreyColorColorPoppins420,
                    // ),
                    // 5.ph,
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

import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_styles/text_styles.dart';

class CustomBackTitle extends StatelessWidget {
  final String title;

  const CustomBackTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 17,
          ),
        ),
        2.pw,
        Text(
          title,
          style: CustomTextStyles.darkGreyColor622,
        ),
      ],
    );
  }
}

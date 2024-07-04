import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/colors/app_colors.dart';

class CreateQrCodeController extends GetxController {
  TextEditingController qrCodeNameController = TextEditingController();
  TextEditingController dateControllerController = TextEditingController();

  selectDate({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: CColors.greenAccentTwoColor,
              onPrimary: CColors.secondaryBlackColor,
              onSurface: CColors.darkGreyColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CColors.darkGreyColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      dateControllerController.text =
          DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }
}

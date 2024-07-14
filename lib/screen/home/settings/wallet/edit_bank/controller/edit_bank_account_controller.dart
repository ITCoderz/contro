import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/bank_account_model/bank_account_model.dart';

class EditBankAccountController extends GetxController {
  BankAccountModel? bankAccountModel;
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  initializeBankAccountModel({required BankAccountModel bankAccountModel}) {
    this.bankAccountModel = bankAccountModel;
    accountNameController.text = bankAccountModel.bankName;
    accountNumberController.text = "8888 8888 8888 8888";
    update();
  }
}

import 'package:chalkdart/chalk.dart';
import 'package:flutter/material.dart';

extension DebugPrintExtensions on String {
  void successPrint() {
    debugPrint(
      chalk.black.onGreen(this),
    );
  }

  void failedPrint() {
    debugPrint(
      chalk.black.onRed(this),
    );
  }
}

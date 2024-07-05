import 'package:get/get.dart';

class CreateVariationsController extends GetxController {
  List<int> noOfVariationsList = <int>[1];

  List<int> options = <int>[1];

  addVariation() {
    noOfVariationsList.add(1);
    options.add(0);
    update();
  }

  removeVariation({required int index}) {
    noOfVariationsList.removeAt(index);
    options.removeAt(index);
    update();
  }

  addOptionAtIndex({required int index}) {
    options[index]++;
    update();
  }

  removeOption({required int index}) {
    options[index]--;
    update();
  }
}

import 'package:get/get.dart';

class SetPickUpDeliveryController extends GetxController {
  final isEditing = false.obs;

  toggleEditing() {
    isEditing.value = !isEditing.value;
  }
}

import 'package:get/get.dart';

class StudentInfoController extends GetxController {
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;

  void changeName(String newName) {
    name.value = newName;
  }

  void changePhoneNumber(String newPhoneNumber) {
    phoneNumber.value = newPhoneNumber;
  }
}

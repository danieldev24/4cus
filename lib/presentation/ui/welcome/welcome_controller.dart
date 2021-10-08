import 'package:flutter/cupertino.dart';
import 'package:focus/base/app_constant.dart';
import 'package:focus/data/models/user_model.dart';
import 'package:focus/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeController extends GetxController{
  TextEditingController nameController = TextEditingController();
  // instance of Get Storage
  final userData = GetStorage();

  // stire loginStatus
  bool isRegister = false;

  // instance of userData model
  late User user;

  @override
  void onInit() {
    nameController = TextEditingController();
    userData.writeIfNull(Constant.USER_NAME, "Hero");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Enter your name';
    }
    if (value.isAlphabetOnly) {
      return null;
    } else
      return 'Enter a valid name';
  }

  // function to validate creds
  bool validateCreds() {
    bool validated = false;
    if (nameValidator(nameController.text) == null) {
      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  userRegister(){
    if(validateCreds()){
      user = User(name: nameController.text);
      userData.write(Constant.USER_NAME, nameController.text);
      userData.write(Constant.IS_REGISTER, true);
      Get.offAllNamed(Routes.HOME);
    }
  }
}
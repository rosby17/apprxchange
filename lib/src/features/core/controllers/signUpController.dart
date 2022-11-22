import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rx_change_3/src/repository/authentidicationRepository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final username = TextEditingController();
  late final name = TextEditingController();

  void registerUser(String email, String password) {
    AuthentificationRepository.instance
        .createUserWithEmailPassword(email, password);
  }
}

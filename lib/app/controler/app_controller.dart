import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  TextEditingController edit_controler = TextEditingController();
  final box = GetStorage();

  saveUser() {
    if (edit_controler.text.length > 3) {
      box.write("user_name", edit_controler.text);
      box.write("user_pontos", '0');

      Get.snackbar(
          "Salvado", "Salvado com sucesso:\nDados: ${box.read('user_name')}");
      return null;
    }
    return 'digite o nome pra a vancar';
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Controller extends GetxController {
  static changelan(var par1) {
    var locate = Locale(par1
    );
    Get.updateLocale(locate);
  }
}

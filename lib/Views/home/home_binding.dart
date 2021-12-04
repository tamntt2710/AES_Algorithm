import 'package:aes_algorithm/Views/home/widgets/decrypt/decrypt_logic.dart';
import 'package:aes_algorithm/Views/home/widgets/encrypt/encrypt_logic.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => EncryptController());
    Get.lazyPut(() => DecryptController());
  }
}

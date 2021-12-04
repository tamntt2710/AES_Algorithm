import 'package:get/get.dart';

import 'encrypt_logic.dart';

class EncryptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EncryptController());
  }
}

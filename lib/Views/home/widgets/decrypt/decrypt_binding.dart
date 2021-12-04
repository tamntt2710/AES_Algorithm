import 'package:get/get.dart';

import 'decrypt_logic.dart';

class DecryptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DecryptController());
  }
}

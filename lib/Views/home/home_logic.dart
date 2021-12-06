import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool autoValidate = RxBool(false);
  Rx<BitType> currentBitType = Rx(BitType.type128Bit);
  RxInt processingTime = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onChangeBit(BitType type) {
    currentBitType.value = type;
    print('change type to ${currentBitType.value}');
  }
}

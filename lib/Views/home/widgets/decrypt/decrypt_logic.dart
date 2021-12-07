import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Views/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecryptController extends GetxController {
  RxList<TextEditingController> cipherTextControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;
  TextEditingController keyTextEditingController = TextEditingController();
  final GlobalKey<FormState> formDecryptKey =
      GlobalKey<FormState>(debugLabel: 'fuck');
  RxBool autoValidate = RxBool(false);
  Rx<BitType> currentBitType = Get.find<HomeController>().currentBitType;
  RxInt processingTime = Get.find<HomeController>().processingTime;
  RxList<int> cipherTexts = RxList.empty();
  RxString decryptedText = 'Decrypted Text'.obs;

  void onTapDecrypt() {
    if (true) {
      DateTime time1 = DateTime.now();
/*
      cipherTexts.clear();
      for (var textController in cipherTextControllers) {
        debugPrint('val= ${textController.text}');
        cipherTexts.add(int.parse(textController.text, radix: 16));
      }
      cipherTexts.forEach(print);
*/
      if (true) {
        AESModel aesModel = AESModel(
            plaintText: Hex.fromPresentationString(
                '0x8b5a24ea1e871f5795422d965d6ddef87e5b17f16abe681add0c110b945a16b11580aab5b0c0a8e956bde0992bb0f3d1'),
            plaintTextKey: keyTextEditingController.text,
            bitType: BitType.type128Bit);
        print(aesModel.decryptToHex().toPlaintText());
      }
    }
  }

  bool get validateAndSave {
    final form = formDecryptKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    autoValidate = RxBool(true);
    return false;
  }

  Rx<bool> isValidated = RxBool(true);
}

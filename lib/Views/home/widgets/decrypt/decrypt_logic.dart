import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Views/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecryptController extends GetxController {

  TextEditingController encryptedTextEditingController = TextEditingController();
  TextEditingController keyTextEditingController = TextEditingController();
  final GlobalKey<FormState> formDecryptKey =
      GlobalKey<FormState>(debugLabel: 'fuck');
  RxBool autoValidate = RxBool(false);
  Rx<BitType> currentBitType = Get.find<HomeController>().currentBitType;
  RxInt processingTime = Get.find<HomeController>().processingTime;
  RxList<int> cipherTexts = RxList.empty();
  TextEditingController decryptedText = TextEditingController();

  void onTapDecrypt() {
    if (true) {
      if (true) {
        AESModel aesModel = AESModel(
            encryptedText:
            encryptedTextEditingController.text,
            plaintTextKey: keyTextEditingController.text,
            bitType: BitType.type128Bit);
        Hex output = aesModel.decryptToHex(); //4869e1babf7520c491e1bab9702074726169
        debugPrint('result = ${output.stringPresent}');
        decryptedText.text = output.toPlaintText();
        processingTime.value = aesModel.processingTime;
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

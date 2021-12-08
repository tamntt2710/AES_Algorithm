import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Views/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecryptController extends GetxController {
  TextEditingController encryptedTextEditingController =
      TextEditingController();
  TextEditingController keyTextEditingController = TextEditingController();
  RxBool autoValidate = RxBool(false);
  Rx<BitType> currentBitType = Get.find<HomeController>().currentBitType;
  RxInt processingTime = Get.find<HomeController>().processingTime;
  RxList<int> cipherTexts = RxList.empty();
  TextEditingController decryptedText = TextEditingController();
  Rx<EncodeType> encryptEncodeType = Rx(EncodeType.base64);
  TextEditingController outputDecrytedController = TextEditingController();
  final GlobalKey<FormState> formDecryptKey =
      GlobalKey<FormState>(debugLabel: 'decrypt');

  @override
  void onInit() {
    super.onInit();
  }

  void onTapDecrypt() {
    if (validateAndSave) {
      String input = EncodeType.base64 == EncodeType.base64
          ? Hex.fromBase64(encryptedTextEditingController.text).stringPresent
          : encryptedTextEditingController.text;

      AESModel aesModel = AESModel(
          encryptedText: input,
          plaintTextKey: keyTextEditingController.text,
          bitType: currentBitType.value);
      Hex output =
          aesModel.decryptToHex(); //4869e1babf7520c491e1bab9702074726169
      debugPrint('result = ${output.stringPresent}');
      decryptedText.text = output.toPlaintText();
      processingTime.value = aesModel.processingTime;
      print(aesModel.decryptToHex().toPlaintText());
      outputDecrytedController.text = output.toPlaintText();
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

  void clearText() {
    encryptedTextEditingController.clear();
    keyTextEditingController.clear();
    outputDecrytedController.clear();
    autoValidate.value = false;
  }
}

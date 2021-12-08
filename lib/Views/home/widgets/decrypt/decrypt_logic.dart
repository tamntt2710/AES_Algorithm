import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Views/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';

class DecryptController extends GetxController {
  TextEditingController encryptedTextEditingController =
      TextEditingController();
  TextEditingController keyTextEditingController = TextEditingController();
  RxBool autoValidate = RxBool(true);
  Rx<BitType> currentBitType = Get.find<HomeController>().currentBitType;
  RxInt processingTime = Get.find<HomeController>().processingTime;
  RxList<int> cipherTexts = RxList.empty();
  Rx<EncodeType> encryptEncodeType = Rx(EncodeType.base64);
  TextEditingController outputDecryptedController = TextEditingController();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'decrypt');

  @override
  void onInit() {
    super.onInit();
    currentBitType.listen((val) {
      outputDecryptedController.clear();
      keyTextEditingController.clear();
      encryptedTextEditingController.clear();
    });
    encryptedTextEditingController.addListener(() {
      outputDecryptedController.clear();
    });
  }

  void onTapDecrypt() {
    if (validateAndSave) {
      String input = encryptEncodeType.value == EncodeType.base64
          ? Hex.fromBase64(encryptedTextEditingController.text).stringPresent
          : encryptedTextEditingController.text;

      AESModel aesModel = AESModel(
          encryptedText: input,
          plaintTextKey: keyTextEditingController.text,
          bitType: currentBitType.value);
      Hex output =
          aesModel.decryptToHex(); //4869e1babf7520c491e1bab9702074726169
      debugPrint('result = ${output.stringPresent}');
      processingTime.value = aesModel.processingTime;
      print(aesModel.decryptToHex().toPlaintText());
      outputDecryptedController.text = output.toPlaintText();
    }
  }

  bool get validateAndSave {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    autoValidate.value = true;
    return false;
  }

  void clearText() {
    encryptedTextEditingController.clear();
    keyTextEditingController.clear();
    outputDecryptedController.clear();
    autoValidate.value = false;
  }
}

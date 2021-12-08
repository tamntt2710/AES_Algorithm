import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Views/home/home_logic.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:aes_algorithm/common/function_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EncryptController extends GetxController {
  TextEditingController plainTextEditingController = TextEditingController();
  TextEditingController keyTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'encrypt');
  RxBool autoValidate = RxBool(true);
  Rx<BitType> currentBitType = Get.find<HomeController>().currentBitType;
  RxInt processingTime = Get.find<HomeController>().processingTime;
  TextEditingController outputTextEditingController = TextEditingController();
  TextEditingController outputDecrytedController = TextEditingController();
  RxBool isDecrypting = false.obs;
  Rx<EncodeType> encryptEncodeType = Rx(EncodeType.base64);
  Rx<EncodeType> decryptEncodeType = Rx(EncodeType.base64);
  void onTapEncrypt() {
    isDecrypting.value=false;
    if (validateAndSave) {
      AESModel aesModel = AESModel(
          plaintText: plainTextEditingController.text,
          plaintTextKey: keyTextEditingController.text,
          bitType: currentBitType.value);
      Hex output =
          aesModel.encryptToHex(); //4869e1babf7520c491e1bab9702074726169
      debugPrint('result = ${output.stringPresent}');
      outputTextEditingController.text = output.stringPresent;
      processingTime.value = aesModel.processingTime;
    }
  }
  void onTapDecrypt() {
    isDecrypting.value = true;
      if (validateAndSave) {
        AESModel aesModel = AESModel(
            encryptedText:
            outputTextEditingController.text,
            plaintTextKey: keyTextEditingController.text,
            bitType: currentBitType.value);
        Hex output = aesModel.decryptToHex(); //4869e1babf7520c491e1bab9702074726169
        debugPrint('result = ${output.stringPresent}');
        outputDecrytedController.text = output.toPlaintText();
        processingTime.value = aesModel.processingTime;
        print(aesModel.decryptToHex().toPlaintText());
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

  Rx<bool> isValidated = RxBool(true);
  void clearText() {
    plainTextEditingController.clear();
    keyTextEditingController.clear();
    outputTextEditingController.clear();
    autoValidate.value = false;
  }

  void copyToClipBoard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    FunctionUtil.showToast('Copied "$text" to Clipboard');
  }

}

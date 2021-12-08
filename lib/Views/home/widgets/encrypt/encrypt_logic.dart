import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Views/home/home_logic.dart';
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
  RxBool isDecrypting = false.obs;
  Rx<EncodeType> encryptEncodeType = Rx(EncodeType.base64);
  Hex? result;

  @override
  void onInit() {
    super.onInit();
    encryptEncodeType.listen((type) {
      if (type == EncodeType.base64) {
        outputTextEditingController.text = result!.toBase64();
      } else if (type == EncodeType.hex) {
        outputTextEditingController.text = result!.stringPresent;
      }
    });
  }

  void onTapEncrypt() {
    if (validateAndSave) {
      AESModel aesModel = AESModel(
          plaintText: plainTextEditingController.text,
          plaintTextKey: keyTextEditingController.text,
          bitType: currentBitType.value);
      result = aesModel.encryptToHex(); //4869e1babf7520c491e1bab9702074726169
      debugPrint('result = ${result!.stringPresent}');

      outputTextEditingController.text =
          encryptEncodeType.value == EncodeType.base64
              ? result!.toBase64()
              : result!.stringPresent;
      processingTime.value = aesModel.processingTime;
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

  void copyToClipBoard() {
    String text = outputTextEditingController.text;
    Clipboard.setData(ClipboardData(text: text));
    FunctionUtil.showToast('Copied "$text" to Clipboard');
  }

  void onEncodeTypeChange(EncodeType type) {
    encryptEncodeType.value = type;
  }
}

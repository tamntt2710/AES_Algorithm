import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
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
  RxList<int> cipherTexts = RxList.empty();
  void onTapEncrypt() {
    if (validateAndSave) {
      DateTime time1 = DateTime.now();
      debugPrint('plaintText = ${plainTextEditingController.text}');
      debugPrint('KeyText = ${keyTextEditingController.text}');
      debugPrint(
          "---------------------Bắt đầu mã hóa với Khóa mã hóa-----------------------------");
      String textKey = keyTextEditingController.text;
      debugPrint("Khóa mã hóa : $textKey");
      List<int> Key = List.filled(currentBitType.value.Nr, 0);
      Key = input(textKey, Key);
      ShowMatrix(Key, currentBitType.value.Nr);
      debugPrint("\n---------------------Bắt đầu mã hóa với "
          "Planittext-----------------------------");
      String str = plainTextEditingController.text;
      debugPrint("\nInput String : $str");
      List<int> state = List.filled(Nb, 0);
      state = input(str, state);
      ShowMatrix(state, 4);
      List<int> C = MahoaAES(
          state, Key, currentBitType.value.Nr, currentBitType.value.Nk);
      cipherTexts.clear();
      cipherTexts.addAll(C);
      debugPrint("\nBản mã :");
      ShowMatrix(C, Nb);
      debugPrint(
          "\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
      List<int> D =
          GiaimaAES(C, Key, currentBitType.value.Nr, currentBitType.value.Nk);
      debugPrint("\nGiai ma :");
      ShowMatrix(D, Nb);
      debugPrint('\nOutput String : ');
      output(D);
      DateTime time2 = DateTime.now();
      debugPrint("\nTime of Process");
      double a = (time2.millisecond - time1.millisecond) / 1000;
      processingTime.value = time2.difference(time1).abs().inMilliseconds;
      debugPrint(" $a");
      time2.subtract(Duration(
        seconds: time1.second,
      ));
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
    cipherTexts.clear();
    autoValidate.value = false;
  }

  void copyToClipBoard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    FunctionUtil.showToast('Copied "$text" to Clipboard');
  }
}

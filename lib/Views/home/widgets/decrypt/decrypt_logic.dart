import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Views/home/home_logic.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecryptController extends GetxController {
  RxList<TextEditingController> cipherTextControllers =
      [TextEditingController(),
    TextEditingController(),TextEditingController(),TextEditingController(),].obs;
  TextEditingController keyTextEditingController = TextEditingController();
  final GlobalKey<FormState> formDecryptKey = GlobalKey<FormState>(debugLabel: 'fuck');
  RxBool autoValidate = RxBool(false);
  Rx<BitType> currentBitType = Get.find<HomeController>().currentBitType;
  RxInt processingTime = Get.find<HomeController>().processingTime;
  RxList<int> cipherTexts = RxList.empty();
  RxString decryptedText = 'Decrypted Text'.obs;

  void onTapDecrypt() {
    if (validateAndSave) {
      DateTime time1 = DateTime.now();
      cipherTexts.clear();
      for(var textController in cipherTextControllers){
        debugPrint('val= ${textController.text}');
        cipherTexts.add(int.parse(textController.text,radix: 16));
      }
      cipherTexts.forEach(print);
      if (true) {
        String textKey = keyTextEditingController.text;
        debugPrint("Khóa mã hóa : $textKey");
        List<int> Key = List.filled(currentBitType.value.Nr, 0);
        Key = input(textKey, Key);
        ShowMatrix(Key, currentBitType.value.Nr);

        debugPrint("\nBản mã :");
        ShowMatrix(cipherTexts, Nb);
        debugPrint(
            "\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
        List<int> D =
            GiaimaAES(cipherTexts, Key, currentBitType.value.Nr, currentBitType.value.Nk);
        debugPrint("\nGiai ma :");
        ShowMatrix(D, Nb);
        debugPrint('\nOutput String : ');
        String? test = output(D);
        decryptedText.value = test??'';
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

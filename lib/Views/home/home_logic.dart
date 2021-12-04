import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:aes_algorithm/common/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController plainTextEditingController = TextEditingController();
  TextEditingController keyTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool autoValidate = RxBool(false);
  Rx<BitType> currentBitType= Rx(BitType.type128Bit);
  RxInt processingTime=0.obs;
  RxList<int> cipherTexts= RxList.empty();
  @override
  void onInit() {
    super.onInit();
  }
  void onTapEncrypt(){
    if (validateAndSave) {
      print('plaintText = ${plainTextEditingController.text}');
      print('KeyText = ${keyTextEditingController.text}');
      DateTime time1 = DateTime.now();
      print("---------------------Bắt đầu mã hóa với Khóa mã hóa-----------------------------");
      String TextKey = keyTextEditingController.text;
      print("Khóa mã hóa : $TextKey");
      List<int> Key = List.filled(currentBitType.value.Nr,0);
      Key = input(TextKey,Key);
      ShowMatrix(Key,currentBitType.value.Nr);
      print("\n---------------------Bắt đầu mã hóa với "
          "Planittext-----------------------------");
      String str = plainTextEditingController.text;
      print("\nInput String : $str");
      List<int> state = List.filled(Nb,0);
      state = input(str, state);
      ShowMatrix(state,4);
      List<int> C = MahoaAES(state,Key,currentBitType.value.Nr,currentBitType.value.Nk);
      cipherTexts.addAll(C);
      print("\nBản mã :");
      ShowMatrix(C,Nb);
      print("\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
      List<int> D = GiaimaAES(C,Key,currentBitType.value.Nr,currentBitType.value.Nk);
      print("\nGiai ma :");
      ShowMatrix(D,Nb);
      print('\nOutput String : ');
      output(D);
      DateTime time2 = DateTime.now();
      print("\nTime of Process");
      double a = (time2.millisecond - time1.millisecond) / 1000;
      processingTime.value = time2.difference(time1).abs().inMilliseconds;
      print(" $a");
      time2.subtract(Duration(seconds: time1.second,));
    }
  }
  bool get validateAndSave {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    autoValidate = RxBool(true);
    return false;
  }
  Rx<bool> isValidated = RxBool(true);

  //Validators
  var plaintTextValidator = MultiValidator([
    MinLengthValidator(
        16, errorText: 'Vui lòng nhập đủ 16 ký tự'),
    MaxLengthValidator(16, errorText: 'Vui lòng nhập đúng 16 ký tự')
  ]);

  void plaintTextOnChanged(String val){
    plaintTextValidator =MultiValidator([
      MinLengthValidator(
          16, errorText: 'Vui lòng nhập tiếp ${16-val.length} ký tự'),
      MaxLengthValidator(16, errorText: 'Vui lòng nhập đúng 16 ký tự')
    ]);
    print('Vui lòng nhập đủ ${16-val.length} ký tự');
  }
  void onChangeBit(BitType type){
    currentBitType.value = type;
    print('change type to ${currentBitType.value}');
  }
}

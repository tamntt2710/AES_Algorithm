import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:aes_algorithm/common/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool autoValidate = RxBool(false);
  Rx<BitType> currentBitType= Rx(BitType.type128Bit);
  RxInt processingTime=0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  void onChangeBit(BitType type){
    currentBitType.value = type;
    print('change type to ${currentBitType.value}');
  }
}

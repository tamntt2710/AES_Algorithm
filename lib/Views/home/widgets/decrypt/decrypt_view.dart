import 'dart:ui';

import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Views/home/widgets/title_of_action.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:aes_algorithm/common/formatters.dart';
import 'package:aes_algorithm/common/validate_util.dart';
import 'package:aes_algorithm/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'decrypt_logic.dart';

class DecryptPage extends StatelessWidget {
  const DecryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DecryptController>();
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.h),
      margin: EdgeInsets.symmetric(vertical: 250.h,horizontal: 5),
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TitleOfAction(
            title: "Information Security",
            textColor: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Phạm Doãn Hiếu - CT030407",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        wordSpacing: 2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 10.0),
                  child: Container(
                    child: Text(
                      "Nguyễn Thị Thanh Tâm - CT030444",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          wordSpacing: 2),
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget _buildRowOfDecrypt({TextEditingController? textController}) {
    return Container(
      width: 40.w,
      height: 40.h,
      child: Center(
          child: TextFormField(
        controller: textController,
        textAlign: TextAlign.start,
        validator: (val) => Validate.validateCipherText(val),
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
          FilteringTextInputFormatter.allow(RegExp(r'[\da-fA-F]')),
          UpperCaseTextFormatter()
        ],
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        decoration: InputDecoration(
          prefixText: '0x',
          contentPadding: EdgeInsets.only(left: 90),
          prefixStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              wordSpacing: 2),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          errorStyle: TextStyle(color: Colors.white, fontSize: 14),
        ),
      )),
    );
  }

  Widget _buildInputKey(
      DecryptController controller, double vertical, bool encrypt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: TextFormField(
        controller: controller.keyTextEditingController,
        style: encrypt
            ? const TextStyle(color: kPrimaryColor)
            : const TextStyle(color: Colors.white),
/*
        validator: (val) =>
            Validate.validateKey(val, controller.currentBitType.value),
*/
        inputFormatters: [
          LengthLimitingTextInputFormatter(
              controller.currentBitType.value.limitLength),
        ],
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: encrypt
                  ? BorderSide(color: kPrimaryColor, width: 2.0)
                  : BorderSide(color: Colors.white, width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            labelText: "Enter your key",
            labelStyle: encrypt
                ? TextStyle(color: kPrimaryColor, fontSize: 14)
                : TextStyle(color: Colors.white, fontSize: 14),
            errorStyle: TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }
}

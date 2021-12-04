import 'package:aes_algorithm/common/validate_util.dart';
import 'package:aes_algorithm/Views/home/widgets/title_of_action.dart';
import 'package:aes_algorithm/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'decrypt_logic.dart';

class DecryptPage extends StatelessWidget {
  const DecryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DecryptController>();

    return Container(
      width: 150.w,
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Column(
        children: [
          const TitleOfAction(title: "AES Encryption"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 0.h),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RowOfDecrypt(),
                      RowOfDecrypt(),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RowOfDecrypt(),
                      RowOfDecrypt(),
                    ],
                  ),
                  _buildInputKey(controller, 30, false),
                  CustomButton(onTap: () {}, text: 'Decrypt', encrypt: false),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Text(
                          "Decrypted Text",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget RowOfDecrypt() {
    return Container(
      height: 50.h,
      width: 30.w,
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
          child: TextFormField(
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
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
        validator: (val) =>
            Validate.validateKey(val, controller.currentBitType.value),
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
            labelText: "Enter your key",
            labelStyle: encrypt
                ? TextStyle(color: kPrimaryColor, fontSize: 14)
                : TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }
}

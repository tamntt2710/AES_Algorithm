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

import 'encrypt_logic.dart';

class EncryptPage extends StatelessWidget {
  const EncryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EncryptController>();

    return Container(
      width: 150.w,
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
      decoration: const BoxDecoration(color: kBackgroundColor),
      child: Column(
        children: [
          const TitleOfAction(title: "Encryption"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
            child: Obx(() {
              return Form(
                key: controller.formKey,
                autovalidateMode: controller.autoValidate.isTrue
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildInputPlaintText(
                        controller,
                        "Plaint "
                        "Text"),
                    _buildInputKey(controller, 30, true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            onTap: () {
                              controller.clearText();
                            },
                            text: "Clear Text",
                            encrypt: true),
                        CustomButton(
                            onTap: () {
                              controller.onTapEncrypt();
                            },
                            text: "Encrypt",
                            encrypt: true),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
          true
              ? Obx(() {
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 5 / 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemBuilder: (_, index) =>
                        decryptedCode(controller.cipherTexts[index]),
                    itemCount: controller.cipherTexts.length,
                  );
                })
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        decryptedCode(0x321456AE),
                        decryptedCode(0x321456AE)
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        decryptedCode(0x321456AE),
                        decryptedCode(0x321456AE)
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildInputPlaintText(EncryptController controller, String label) {
    return TextFormField(
      controller: controller.plainTextEditingController,
      validator: (val) => Validate.validatePlainText(val),
      inputFormatters: [
        LengthLimitingTextInputFormatter(16),
      ],
      style: const TextStyle(color: kPrimaryColor),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: kPrimaryColor, fontSize: 14)),
    );
  }

  Widget decryptedCode(int text) {
   String str = '';
   str = '0x' + '0'*(8-text.toRadixString(16).toUpperCase().length)+ text
       .toRadixString(16).toUpperCase();
    return Container(
      width: 40.w,
      height: 20.h,
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Center(
        child: SelectableText(
          str,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              wordSpacing: 2),
        ),
      ),
    );
  }

  Widget _buildInputKey(
      EncryptController controller, double vertical, bool encrypt) {
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
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
            ),
            labelText: 'Enter your key',
            labelStyle: const TextStyle(color: kPrimaryColor, fontSize: 14)),
      ),
    );
  }
}

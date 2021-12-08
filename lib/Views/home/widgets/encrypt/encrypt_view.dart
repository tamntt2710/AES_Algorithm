import 'dart:ui';

import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
import 'package:aes_algorithm/Views/home/widgets/decrypt/decrypt_logic.dart';
import 'package:aes_algorithm/Views/home/widgets/title_of_action.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:aes_algorithm/common/validate_util.dart';
import 'package:aes_algorithm/widgets/custom_button.dart';
import 'package:aes_algorithm/widgets/custom_radio_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'encrypt_logic.dart';

class EncryptPage extends StatelessWidget {
  const EncryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EncryptController>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.h),
      child: Column(
        children: [
          const TitleOfAction(title: "Encryption"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.only(top: 10.h),
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
                    _buildInputKey(controller, 20, true),
                    SizedBox(height: 8.h),
                    _buildRadioHexOrBase64(
                        controller, 'Encryption Format', true),
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Encrypted Text: ',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    _buildOutputCipher(controller, ''),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildInputPlaintText(EncryptController controller, String label) {
    return Obx(() {
      print('controller.isDecrypting = ${controller.isDecrypting.value}');
      return TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        validator: Validate.validatePlainText,
        controller: controller.plainTextEditingController,
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
            labelStyle: const TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      );
    });
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
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
            ),
            labelText: 'Enter your key',
            labelStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildRadioHexOrBase64(
      EncryptController controller, String text, bool isEncrypt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('$text: ',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(width: 16),
        RadioButtonGroup(
          items: ["Base64", "Hex"],
          onChanged: (index, val) {
            EncodeType selected = EncodeTypeEnum.getEncodeType(index ?? 0);
            controller.onEncodeTypeChange(selected);
          },
        ),
      ],
    );
  }

  Widget _buildOutputCipher(EncryptController controller, String label) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      readOnly: true,
      onTap: () {
        controller.copyToClipBoard();
      },
      controller: controller.outputEncryptedTextEditingController,
      style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
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
}

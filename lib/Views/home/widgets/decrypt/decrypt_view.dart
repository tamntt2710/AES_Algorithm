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

class DecryptPage extends StatelessWidget {
  const DecryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DecryptController>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.h),
      child: Column(
        children: [
          const TitleOfAction(title: "Decryption"),
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
                    _buildInputEncryptedText(
                        controller,
                        "Encrypted "
                        "Text"),
                    _buildInputKey(controller, 20, true),
                    SizedBox(height: 8),
                    _buildRadioHexOrBase64(
                        controller, 'Encryption Format', false),
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
                              controller.onTapDecrypt();
                            },
                            text: 'Decrypt',
                            encrypt: true),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Decrypted Text: ',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    _buildOutputDecrytedText(controller, ''),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildInputEncryptedText(DecryptController controller, String label) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      validator: (val) {
        return controller.encryptEncodeType.value==EncodeType.hex? Validate
            .validateHexInput(
            val):Validate.validateBase64Text(val);
      },
      controller: controller.encryptedTextEditingController,
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
              color: kPrimaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInputKey(
      DecryptController controller, double vertical, bool encrypt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: Obx(() {
        return TextFormField(
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
        );
      }),
    );
  }

  Widget _buildRadioHexOrBase64(
      DecryptController controller, String text, bool isDecrypt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('$text: ',
            style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(width: 16),
        Obx(() {
          return RadioButtonGroup(
            initialIndex: controller.encryptEncodeType.value.index,
            items: ["Base64", "Hex"],
            onChanged: (index, val) {
              EncodeType selected = EncodeTypeEnum.getEncodeType(index ?? 0);
              controller.encryptEncodeType.value = selected;
            },
          );
        }),
      ],
    );
  }

  Widget _buildOutputDecrytedText(DecryptController controller, String label) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      readOnly: true,
      controller: controller.outputDecryptedController,
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

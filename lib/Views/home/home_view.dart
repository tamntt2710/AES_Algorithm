import 'package:aes_algorithm/common/validate_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/common/constant.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor:kPrimaryColor,
        title: _buildAppBar(),
      ),
      body: Container(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: Column(
                        children: [
                          SizedBox(width: 200,
                            child: CustomRadioButton(
                              elevation: 0,
                              horizontal: true,
                              defaultSelected: controller.currentBitType.value,
                              unSelectedColor: Theme
                                  .of(context)
                                  .canvasColor,
                              buttonLables: BitTypeEnum.bitListLabel,
                              buttonValues: BitTypeEnum.bitList,
                              shapeRadius: 10,
                              enableShape: true,
                              buttonTextStyle: ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.black,
                                  textStyle: TextStyle(fontSize: 18)),
                              radioButtonValue: (value) {
                                print('${value}');
                                BitType selectedEnum = value as BitType;
                                controller.onChangeBit(selectedEnum);
                              },
                              selectedColor: Theme
                                  .of(context)
                                  .accentColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 40.h, horizontal: 20.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Center(
                                child: Obx(() {
                                  return Text(
                                    "Thời gian : ${controller.processingTime
                                        .value} ms", style:
                                  TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      wordSpacing: 2
                                  ),);
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150.w,

                      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal:
                      20.h),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                        children: [
                          titleOfAction("AES Encryption"),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.h, horizontal: 20.h),
                            child: Obx(() {
                              return Form(
                                key: controller.formKey,
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildInputPlaintText(controller, "Plaint "
                                        "Text"),
                                    _buildInputKey(controller, 30, true),
                                    buttonAction(controller, "Encrypt", true),
                                  ],
                                ),
                              );
                            }),
                          ),

                          Container(
                            height: 200,
                            child: true ? Obx(() {
                              return GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                                itemBuilder: (_, index) =>
                                    decrytedCode
                                      (controller.cipherTexts[index]),
                                itemCount: controller.cipherTexts.length,
                              );
                            }) : Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    decrytedCode(0x321456AE),
                                    decrytedCode(0x321456AE)
                                  ],
                                ),
                                SizedBox(height: 30.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    decrytedCode(0x321456AE),
                                    decrytedCode(0x321456AE)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150.w,
                      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal:
                      20.h),
                      decoration: BoxDecoration(
                          color: kPrimaryColor),
                      child: Column(
                        children: [
                          titleOfAction("AES Decryption"),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.h, horizontal:
                            0.h),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      RowOfDecrypt(),
                                      RowOfDecrypt(),
                                    ],
                                  ),
                                  SizedBox(height: 15.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      RowOfDecrypt(),
                                      RowOfDecrypt(),
                                    ],
                                  ),
                                  _buildInputKey(controller, 30, false),
                                  buttonAction(controller, "Decrypt", false),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      height: 40.h,
                                      decoration:
                                      BoxDecoration(color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "Decrypted Text",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              wordSpacing: 2),),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // giai ma
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildAppBar() {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Center(
        child: Text(
          "AES Algorithm",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50
          ),
        ),
      ),
    );
  }

  Widget chooseButton(int bit) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
      child: ElevatedButton(
        child: Text('$bit bit'),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: kSecondColor,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget decrytedCode(int text) {
    return Container(
      width: 40.w,
      decoration: BoxDecoration(
          color: kPrimaryColor),
      child: Center(
        child: Text(
          "0x${text.toRadixString(16).toUpperCase()}", style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            wordSpacing: 2

        ),),
      ),
    );
  }

  Widget buttonAction(HomeController controller, String text, bool encrypt) {
    return GestureDetector(
      onTap: controller.onTapEncrypt,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: encrypt
            ? BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(30))
            : BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),

        ),
        child: Center(
          child: encrypt ? Text(text, style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),) : Text(text, style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontSize: 18),),
        ),
      ),
    );
  }

  Widget _buildInputKey(HomeController controller, double vertical,
      bool encrypt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: TextFormField(
        controller: controller.keyTextEditingController,
        style: encrypt
            ? TextStyle(color: kPrimaryColor)
            : TextStyle(color: Colors.white),
        validator: (val) =>
            Validate.validateKey(val, controller
                .currentBitType.value),
        inputFormatters: [LengthLimitingTextInputFormatter(controller
            .currentBitType.value.limitLength),
        ],

        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: encrypt
                  ? BorderSide(color: kPrimaryColor, width: 2.0)
                  : BorderSide(color: Colors.white, width: 2.0),
            ),
            labelText: "Enter your key",
            labelStyle: encrypt ? TextStyle(
                color: kPrimaryColor, fontSize: 14) : TextStyle(
                color: Colors.white,
                fontSize: 14
            )
        ),
      ),
    );
  }

  Widget _buildInputPlaintText(HomeController controller, String label) {
    return TextFormField(
      controller: controller.plainTextEditingController,
      validator: (val) => Validate.validatePlainText(val),
      onChanged: controller.plaintTextOnChanged,
      inputFormatters: [LengthLimitingTextInputFormatter(16),],
      style: TextStyle(color: kPrimaryColor),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          labelText: label,
          labelStyle: TextStyle(color: kPrimaryColor, fontSize: 14)),
    );
  }

  Widget titleOfAction(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h,
          horizontal: 20.h),
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Text(title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
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
}

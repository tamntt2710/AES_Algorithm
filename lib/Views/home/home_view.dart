import 'dart:ui';
import 'package:aes_algorithm/Views/home/widgets/decrypt/decrypt_view.dart';
import 'package:aes_algorithm/Views/home/widgets/encrypt/encrypt_view.dart';
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

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenUtil().screenHeight,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: _buildAppBar(),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Divider(height: 2),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                // height: 400,
                                width: 300,
                                child: CustomRadioButton(
                                  height: 50.h,
                                  spacing: 8.h,
                                  unSelectedBorderColor: Colors.white,
                                  elevation: 0,
                                  horizontal: true,
                                  defaultSelected:
                                      controller.currentBitType.value,
                                  unSelectedColor: Colors.white,
                                  buttonLables: BitTypeEnum.bitListLabel,
                                  buttonValues: BitTypeEnum.bitList,
                                  shapeRadius: 20,
                                  enableShape: true,
                                  buttonTextStyle: const ButtonTextStyle(
                                      selectedColor: Colors.white,
                                      unSelectedColor: kPrimaryColor,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          wordSpacing: 3)),
                                  radioButtonValue: (value) {
                                    BitType selectedEnum = value as BitType;
                                    controller.onChangeBit(selectedEnum);
                                  },
                                  selectedColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 40.h, horizontal: 20.h),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Obx(() {
                                      return Text(
                                        "Time : ${controller.processingTime.value} ms",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            wordSpacing: 2),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Phạm Doãn Hiếu - CT030419",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      wordSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: EncryptPage()),
                  // giai ma
                  const Expanded(child: DecryptPage())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildAppBar() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: const Center(
        child: Text(
          "AES Algorithm",
          style: TextStyle(
              color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 50),
        ),
      ),
    );
  }
}

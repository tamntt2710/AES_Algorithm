import 'package:aes_algorithm/Views/home/widgets/decrypt/decrypt_view.dart';
import 'package:aes_algorithm/Views/home/widgets/encrypt/encrypt_view.dart';
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

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: _buildAppBar(),
          toolbarHeight: 80),
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
                          SizedBox(
                            width: 200,
                            child: CustomRadioButton(
                              elevation: 0,
                              horizontal: true,
                              defaultSelected: controller.currentBitType.value,
                              unSelectedColor: Theme.of(context).canvasColor,
                              buttonLables: BitTypeEnum.bitListLabel,
                              buttonValues: BitTypeEnum.bitList,
                              shapeRadius: 8,
                              enableShape: true,
                              buttonTextStyle: const ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.black,
                                  textStyle: TextStyle(fontSize: 18)),
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
                                    "Thời gian : ${controller.processingTime.value} ms",
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
                        ],
                      ),
                    ),
                    Expanded(child: const EncryptPage()),
                    // giai ma
                    Expanded(child: const DecryptPage())
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
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: const Center(
        child: Text(
          "AES Algorithm",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
        ),
      ),
    );
  }
}

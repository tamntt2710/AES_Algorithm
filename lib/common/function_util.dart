import 'package:aes_algorithm/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FunctionUtil {
  static Future<void> showSnackBar(String title, String message) async {
    if (Get.isDialogOpen ?? false) {
      await Future.delayed(Duration(seconds: 3));
      showSnackBar(title, message);
      return;
    }
    Get.snackbar(title, message,
        backgroundColor: Colors.white,
        isDismissible: false,
        boxShadows: [
          const BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]);
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: kBackgroundColor,
        webPosition: "center",
        webBgColor: "FF212121",
        textColor: kBackgroundColor,
        fontSize: 16);
  }
}

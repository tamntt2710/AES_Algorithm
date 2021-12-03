import 'dart:developer' as Dev;
import 'dart:io';
import 'dart:math';

import 'package:aes_algorithm/utils/strings.dart';
import 'package:aes_algorithm/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class FunctionUtils {
  /// Common Function
  ///
  /// Log
  static void logWhenDebug(dynamic object, String message) {
    if (kDebugMode) {
      if (object is String) {
        Dev.log("$object => $message", name: StringUtils.APP_NAME);
      } else {
        Dev.log("${object.runtimeType} => $message",
            name: StringUtils.APP_NAME);
      }
    }
  }

  ///Convert String to Date
  static String stringToDateFormat(
      {dynamic value, String? format, String? locale}) {
    if (value == null || value.toString().isEmpty) return "";
    String dateString;
    if (locale != null)
      dateString = DateFormat(format, locale)
          .format(DateTime.parse(value.toString()))
          .toString();
    else
      dateString = DateFormat(format)
          .format(DateTime.parse(value.toString()))
          .toString();
    return dateString;
  }

  //Convert Date to String
  static String? dateToDateFormat({DateTime? value, String? format}) {
    if (value == null || format == null) return null;
    String dateString = DateFormat(format).format(value).toString();
    return dateString;
  }

  static Future<bool> checkNetWork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      // return true;
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static String convertFullNameToAvatarText(String? name) {
    final convertName = name
            ?.trim()
            .split(' ')
            .map((e) => e.isNotEmpty ? e.substring(0, 1) : '')
            .toList() ??
        [];
    if (convertName.length > 2) {
      return '${convertName.first}${convertName.last}'.toUpperCase();
    } else {
      return '${convertName.join('')}'.toUpperCase();
    }
  }

  static Future<void> showSnackBar(String title, String message) async {
    if (Get.isDialogOpen ?? false) {
      await Future.delayed(Duration(seconds: 3));
      showSnackBar(title, message);
      return;
    }
    Get.snackbar(title, message,
        backgroundColor: ColorUtils.whiteColor,
        isDismissible: false,
        boxShadows: [
          BoxShadow(
            color: ColorUtils.secondaryColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]);
  }

  static String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  static void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

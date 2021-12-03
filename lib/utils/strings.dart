import 'package:get/get.dart';

class StringUtils {
  /// Common String
  static const String APP_NAME = "USMH_PICKING";

  static bool nullOrEmpty(String? value) {
    if (value == null || value.trim() == "") {
      return true;
    }
    return false;
  }

  static String getMessageErrorFromServer(String? message, String? code) {
    if (message != null && code != null) {
      return '$message \n (${'code'.tr}: $code)';
    } else if (message != null) {
      return '$message';
    }
    return "";
  }
}

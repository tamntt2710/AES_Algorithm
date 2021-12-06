import 'package:aes_algorithm/Model/bit_enum.dart';

class Validate {
  static String? validatePlainText(String? value) {
    if ((value?.length ?? 0) < 16) {
      return 'Vui lòng nhập tiếp ${16 - (value?.length ?? 0)} ký tự';
    }
    return null;
  }

  static String? validateKey(String? value, BitType type) {
    if ((value?.length ?? 0) < type.limitLength) {
      return 'Vui lòng nhập tiếp ${type.limitLength - (value?.length ?? 0)} ký tự';
    }
    return null;
  }

  static String? validateCipherText(String? value) {
    if ((value?.length ?? 0) < 8) {
      return 'Vui lòng nhập tiếp ${8 - (value?.length ?? 0)} ký tự';
    }
    return null;
  }
}

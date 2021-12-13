import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:string_validator/string_validator.dart';

class Validate {
  static String? validateHexInput(String? value) {
      if (!isHexadecimal(value??'') && (value!.length  -2 ) % 32 ==0) {
        return 'Input Format hex không hợp lệ';
    }
    return null;
  }static String? validateBase64Text(String? value) {
    if (value!.isEmpty&&value!.length %4!=0 &&!isBase64(value??'') &&
        (!isHexadecimal(Hex.fromBase64(value!).hexString))) {
        return 'Input Format base64 không hợp lệ';
      }
      return null;
  }

  static String? validatePlainText(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Vui lòng nhập ít nhất 1 ký tự';
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
    if ((value?.length ?? 0) % 8 == 0) {
      return 'Vui lòng nhập input hợp lệ';
    }
    return null;
  }
}

import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
import 'package:string_validator/string_validator.dart';

class Validate {
  static String? validateEncryptedText(String? value, EncodeType type) {
    if (type == EncodeType.base64) {
      print('isBase64(value!)= ${isBase64(value!)}');
      if (isBase64(value!)) {
        return 'Input Format base64 không hợp lệ';
      }
    } else if (type == EncodeType.hex) {
      print('isHexadecimal(value= ${isHexadecimal(value!)}');

      if (!isHexadecimal(value)) {
        return 'Input Format hex không hợp lệ';
      }
    }
    return 'Vui lòng nhập input hợp lệ';
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

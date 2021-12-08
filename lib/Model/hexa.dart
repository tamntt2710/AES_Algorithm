import 'dart:convert';

import 'package:convert/convert.dart';

import 'test.dart';

class Hex {
  late List<int> byteCodes;
  late String hexString;

  Hex.fromByteCode(this.byteCodes) {
    hexString = utf8.decode(byteCodes);
  }

  Hex.fromPlaintText(String plaintText) {
    hexString = convertPlainTextToHexString(plaintText);
    byteCodes = hex.decode(hexString);
  }

  Hex.fromHexString(this.hexString) {
    byteCodes = hex.decode(hexString);
  }

  Hex.from0XString(String presentationString) {
    hexString = presentationString.substring(2);
    byteCodes = hex.decode(hexString);
  }

  String get stringPresent {
    return '0x' + hexString;
  }

  String toPlaintText() {
    return utf8.decode(byteCodes);
  }

  String toBase64() {
    String base64 = base64Encode(utf8.encode(hexString));
    print('base64Encode(utf8.encode(hexString)) = $base64');

    print('decode = ${utf8.decode(base64Decode((base64)))}');
    print('byteCodes = $byteCodes');
    return base64;
  }

  Hex.fromBase64(String base64) {
    hexString = utf8.decode(base64Decode((base64)));
    print('hexString = $hexString');
    byteCodes = hex.decode(hexString);
    print('byteCodes = $byteCodes');

    byteCodes = hex.decode(hexString);
  }
}

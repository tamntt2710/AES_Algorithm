import 'dart:convert';

import 'package:aes_algorithm/Model/aesCtr.dart';
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
}

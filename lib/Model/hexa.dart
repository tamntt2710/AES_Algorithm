import 'dart:convert';

import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:convert/convert.dart';

class Hex {
  late List<int> byteCodes;
  late String hexString;

  Hex.fromByteCodes(this.byteCodes) {
    hexString = byteCodesToHexString(byteCodes);
  }

  Hex.fromPlaintText(String plaintText) {
    hexString = convertPlainTextToHexString(plaintText);
    byteCodes = hex.decode(hexString);
  }

  Hex.fromHexString(this.hexString) {
    byteCodes = hex.decode(hexString);
  }
  Hex.fromPresentationString(String presentationString) {
    hexString = presentationString.substring(2);
    print('123' + presentationString);
    print(hexString);
    byteCodes = hex.decode(hexString);
  }

  String convertPlainTextToHexString(String str) {
    //requirer input is
    List<int> input = utf8.encode(str);
    List<String> hex = [];
    for (int number in input) {
      hex.add(number.toRadixString(16));
    }
    String hexString = hex.join();
    return hexString;
  }

  String byteCodesToHexString(List<int> byteCodes) {
    List<String> hex = [];
    for (int number in byteCodes) {
      hex.add(number.toRadixString(16));
    }
    String hexString = hex.join();
    return hexString;
  }

  String get stringPresent {
    return '0x' + hexString;
  }

  List<Hex> splitHexByLength(int length) {
    List<Hex> a = [];
    var splits = splitStringByLength(hexString, length);
    for (var hex in splits) {
      a.add(Hex.fromHexString(hex));
    }
    return a;
  }

  String toPlaintText() {
    return utf8.decode(byteCodes);
  }
}

import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Model/test.dart';

import 'bit_enum.dart';

class AESModel {
  late BitType bitType;
  Hex? plaintText;
  String? plaintTextKey;
  List<String>? ciphers;
  DateTime? startTime;
  DateTime? endTime;

  AESModel({this.plaintTextKey, this.plaintText, required this.bitType});

  //String encryptToBase64() {}

  Hex encryptToHex() {
    startTime = DateTime.now();
    List<int> stateList = [];
    var splitedHexString = splitStringByLength(plaintText!.hexString, 32);
    for (var str in splitedHexString) {
      List<String>? ciphers = convertHexStringToList4HexString(str);
      final List<int> newList = ciphers.map((e) => int.parse(e)).toList();
      List<int> state = MahoaAES(newList, getUIntKey(), bitType.Nr, bitType.Nk);
      stateList.addAll(state);
    }
    endTime = DateTime.now();
    return Hex.fromByteCodes(stateList);
  }

  Hex decryptToHex() {
    List<Hex> splitedHex = plaintText!.splitHexByLength(32);
    List<int> stateList = [];
    for (var hex in splitedHex) {
      List<String>? ciphers = convertHexStringToList4HexString(hex.hexString);
      final List<int> newList = ciphers.map((e) => int.parse(e)).toList();
      List<int> D = GiaimaAES(newList, getUIntKey(), bitType.Nr, bitType.Nk);
      stateList.addAll(outputFunction(D));
    }
    return Hex.fromByteCodes(stateList);
  }

  List<int> getUIntKey() {
    String keyHexString = convertPlainTextToHexString(plaintTextKey!);
    List<String> key = convertHexStringToList4HexString(keyHexString);
    final List<int> keyList = key.map((e) => int.parse(e)).toList();
    return keyList;
  }

  int get processingTime {
    return endTime!.difference(startTime!).inMilliseconds;
  }
}

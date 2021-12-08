import 'dart:convert';

import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Model/test.dart';

import 'bit_enum.dart';

class AESModel {
  late BitType bitType;
  String? plaintText;
  String? encryptedText;
  String? plaintTextKey;
  List<String>? ciphers;
  DateTime? startTime;
  DateTime? endTime;

  AESModel(
      {this.plaintTextKey,
      this.plaintText,
      required this.bitType,
      this.encryptedText});

  //String encryptToBase64() {}

  Hex encryptToHex() {
    startTime = DateTime.now();
    List<int> stateList = [];
    String hexString = convertPlainTextToHexString(plaintText!);
    List<Hex> hexList = splitHexByLength(hexString, 32);
    for (var hex in hexList) {
      List<String>? ciphers = convertHexStringToList4HexString(hex.hexString);
      final List<int> newList = ciphers.map((e) => int.parse(e)).toList();
      List<int> state = MahoaAES(newList, getUIntKey(), bitType.Nr, bitType.Nk);
      stateList.addAll(state);
    }
    print('ciphers= $stateList');
    endTime = DateTime.now();
    return fromCipher(stateList);
  }

  Hex decryptToHex() {
    startTime = DateTime.now();
    if (encryptedText!.isEmpty) {
      print('empty encrypted Text');
    }
    assert(encryptedText!.contains('0x'));
    Hex hex = Hex.from0XString(encryptedText!);
    List<Hex> splitedHex = splitHexByLength(hex.hexString, 32);
    List<int> byteCodes = [];
    for (var hex in splitedHex) {
      List<String>? ciphers = convertHexStringToList4HexString(hex.hexString);
      final List<int> newList = ciphers.map((e) => int.parse(e)).toList();
      List<int> D = GiaimaAES(newList, getUIntKey(), bitType.Nr, bitType.Nk);
      byteCodes.addAll(cipherToInit(D));
    }
    endTime = DateTime.now();
    return Hex.fromByteCode(byteCodes);
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

  Hex fromCipher(List<int> D) {
    String hexString = cipherIntToHexString(D);
    return Hex.fromHexString(hexString);
  }

  String cipherIntToHexString(List<int> cipher) {
    List<String> hex = [];
    for (int number in cipher) {
      hex.add(number.toRadixString(16).padLeft(8, '0'));
    }
    String hexString = hex.join();
    return hexString;
  }

  List<Hex> splitHexByLength(String hexString, int length) {
    List<Hex> a = [];
    var splits = splitStringByLength(hexString, length);
    for (var hex in splits) {
      a.add(Hex.fromHexString(hex));
    }
    return a;
  }

  //input 0x output Hex full length
  Hex fromCipherPresentationString(String presentationString) {
    String hexString = presentationString.substring(2);
    return Hex.fromHexString(hexString);
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
}

import 'dart:convert';

import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/hexa.dart';

String padding(String str, int fixedLength) {
  if (str.length <= fixedLength) {
    while (str.length % fixedLength != 0) {
      str += String.fromCharCode(0);
    }
  }
  return str;
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

List<String> convertHexStringToList4HexString(String hexString) {
  assert(hexString.length == 32);
  List<String> hexList = [];
  hexList = splitStringByLength(hexString, 8);
  for (int i = 0; i < 4; i++) {
    hexList[i] = hexJoin(hexList[i]);
  }
  return hexList;
}

void main() {
  DateTime time1 = DateTime.now();
  String a = "Hiếu đẹp trai";
  String hexString = convertPlainTextToHexString(a);
  List<String> ciphers = convertHexStringToList4HexString(hexString);
  print(ciphers);
  final List<int> newList = ciphers.map((e) => int.parse(e)).toList();
  print("Bản rõ : ");
  ShowMatrix(newList, 4);
  String plainKeyText = "0123456789ABCDEF";
  print("Khóa mã hóa : $plainKeyText");
  String keyHexString = convertPlainTextToHexString(plainKeyText);
  List<String> key = convertHexStringToList4HexString(keyHexString);
  final List<int> Key = key.map((e) => int.parse(e)).toList();
  ShowMatrix(Key, 4);
  List<int> state = MahoaAES(newList, Key, 4, 10);
  print("\nBản mã :");
  ShowMatrix(state, 4);
  print(
      "\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
  List<int> D = GiaimaAES(state, Key, 4, 10);
  print("\nGiai ma :");
  ShowMatrix(D, 4);
  var decoded = utf8.decode(cipherToInit(D));
  print(decoded);
  DateTime time2 = DateTime.now();
  print("\nTime of Process");
  double c = (time2.millisecond - time1.millisecond) / 1000;
  print(" $c");
  time2.subtract(Duration(
    seconds: time1.second,
  ));
}

String hexJoin(String hex) {
  return '0x' + hex;
}

List<int> cipherToInit(List<int> D) {
  List<String> newList = [];
  for (int i = 0; i < D.length; i++) {
    if (D[i] == 0) {
      continue;
    }
    assert(D[i] != 0);
    String hexString = D[i].toRadixString(16).padLeft(8, '0');
    assert(hexString.length == 8);
    List<String> splitted = [];
    for (int i = 0; i < hexString.length; i = i + 2) {
      splitted.add(hexJoin(hexString.substring(i, i + 2)));
    }
    newList = new List.from(newList)..addAll(splitted);
  }
  D = newList.map(int.parse).toList();
  return D;
}

String encryptAES(String hexString) {
  assert(hexString.length == 32);
  List<String> ciphers = convertHexStringToList4HexString(hexString);
  print(ciphers);
  final List<int> newList = ciphers.map((e) => int.parse(e)).toList();
  print("Bản rõ : ");
  ShowMatrix(newList, 4);
  String plainKeyText = "0123456789ABCDEF";
  print("Khóa mã hóa : $plainKeyText");
  String keyHexString = convertPlainTextToHexString(plainKeyText);
  List<String> key = convertHexStringToList4HexString(keyHexString);
  final List<int> Key = key.map((e) => int.parse(e)).toList();
  ShowMatrix(Key, 4);
  List<int> state = MahoaAES(newList, Key, 4, 10);
  // Hex hex = Hex.fromCipher(state);
  print("\nBản mã :");
  ShowMatrix(state, 4);

  // print('${hex.hexString}');
  print(
      "\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
  List<int> D = GiaimaAES(state, Key, 4, 10);
  print("\nGiai ma :");
  ShowMatrix(D, 4);
  var decoded = utf8.decode(cipherToInit(D));
  return decoded;
}

String decryptAES(List<int> state, List<int> Key) {
  print(
      "\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
  List<int> D = GiaimaAES(state, Key, 4, 10);
  print("\nGiai ma :");
  ShowMatrix(D, 4);
  var decoded = utf8.decode(cipherToInit(D));
  return decoded;
}

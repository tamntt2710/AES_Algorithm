import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/hexa.dart';
import 'package:aes_algorithm/Model/test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test padding null character', () {
    String a = 'Hiếu đẹp trai';
    print(a.length);
    a = padding(a, 16);
    print(a.length);
    print('"$a"');
  });
  test('test padding null character', () {
    String a = 'Hiếu đẹp trai';
    String hexString = convertPlainTextToHexString(a);
    print('$hexString');
    var b = padding(hexString, 16);
    print('$b');
    /*13
  16
  "Hiếu đẹp trai   "
  4869e1babf7520c491e1bab9702074726169
  4869e1babf7520c491e1bab9702074726169
*/
  });
  test('aes Model', () {
    AESModel aesModel = AESModel(
        plaintText: 'Hiếu đẹp trai nhất hệ mặt trời',
        plaintTextKey: '0123456789ABCDEF',
        bitType: BitType.type128Bit);
    Hex output = aesModel.encryptToHex(); //4869e1babf7520c491e1bab9702074726169
    Hex encrypted = output;
    print(output
        .stringPresent); //5d5b9bc5d3b35746f7c233f8d328bd51ff9d91abca2264126f3705ef9cc7033
    AESModel aesModel2 = AESModel(
        encryptedText:
            '0x8094432be2757bdc81276dd256c8a16b54d4afdedec1bf370edbb82db1561e34',
        plaintTextKey: '0123456789ABCDEF',
        bitType: BitType.type128Bit);
    Hex decrypted = aesModel2.decryptToHex();
    print(decrypted.hexString);
  });
  test('to convertHexStringToList4HexString', () {
    String a = "Hiếu đẹp trai";
    String hexString = convertPlainTextToHexString(a);
    var splitedHexString = splitStringByLength(hexString, 32);
    String decodedString = '';
    for (var str in splitedHexString) {
      decodedString += encryptAES(str);
    }
    print(decodedString);
    /*
    List<String> ciphers = convertHexStringToList4HexString(hexString);
    print(ciphers);*/
  });
}

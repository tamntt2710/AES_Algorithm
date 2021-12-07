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
        plaintText: Hex.fromPlaintText('Hiếu đẹp trai'),
        plaintTextKey: '0123456789ABCDEF',
        bitType: BitType.type128Bit);
    Hex output = aesModel.encryptToHex(); //4869e1babf7520c491e1bab9702074726169
    Hex encrypted = output;
    print(output
        .hexString); //5d5b9bc5d3b35746f7c233f8d328bd51ff9d91abca2264126f3705ef9cc7033
    AESModel aesModel2 = AESModel(
        plaintText: encrypted,
        plaintTextKey: '0123456789ABCDEF',
        bitType: BitType.type128Bit);
    Hex decrypted = aesModel2.decryptToHex();
    print(decrypted.toPlaintText());
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

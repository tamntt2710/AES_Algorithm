import 'package:aes_algorithm/Model/aesCtr.dart';
import 'package:aes_algorithm/Model/aes_model.dart';
import 'package:aes_algorithm/Model/bit_enum.dart';
import 'package:aes_algorithm/Model/encode_enum.dart';
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
        plaintText:
            'Hi mọi người bài 05 ( không phai ) lúc sản xuất ra 2 bản , bản này cũng là bản gốc Bản nào lên cũng được ! Tùy từng gu và phong cách của mỗi người để cảm nhận',
        plaintTextKey: '0123456789ABCDEF',
        bitType: BitType.type128Bit);
    Hex output = aesModel.encryptToHex(); //4869e1babf7520c491e1bab9702074726169
    Hex encrypted = output;
    print(output
        .stringPresent); //5d5b9bc5d3b35746f7c233f8d328bd51ff9d91abca2264126f3705ef9cc7033
    AESModel aesModel2 = AESModel(
        encryptedText: output.stringPresent,
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
  test('bass64', () {
    Hex input = Hex.fromHexString('dbbc7ca984f7a720e72c82005f7ad46c');
    input.toBase64();
    Hex.fromBase64(input.toBase64());
    /*    String input = EncodeType.base64 == EncodeType.base64
        ? Hex.fromBase64('YuMJ8RecLAmHE55kcktY2kRdJM1MPig7vSOJqPMOmRg=')
            .stringPresent
        : '';
    AESModel aesModel = AESModel(
        encryptedText: input,
        plaintTextKey: '3333333333333333',
        bitType: BitType.type128Bit);
    Hex output = aesModel.decryptToHex(); //4869e1babf7520c491e1bab9702074726169
    print(aesModel.decryptToHex().toPlaintText());
  });*/
  });
// xịn
}

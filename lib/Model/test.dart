import 'dart:convert';

import 'package:aes_algorithm/Model/aesCtr.dart';
List<String> splitStringByLength(String str, int length)
{
  int index = 0;
  List<String> data = [];
  while (index < str.length) {
    data.add(
        str.substring(index, index + 8 <str.length ? index + 8: str.length));
    index = index + length;
  }
  return data;
}
List<String> convertStringtoHexString(String str) {
  List<int> input = utf8.encode(str);
  List<String> hex = [];
  for (int number in input) {
    hex.add(number.toRadixString(16));
  }
  List<String> hexList = [];
  String hexString = hex.join();
  if(hexString.length <= 16) {
    while (hexString.length % 8 != 0) {
      hexString += ' ';
    }
  }else{

  }
  hexList = splitStringByLength(hexString,8);
  for(int i = 0; i<4 ;i++){
    hexList[i]=hexJoin(hexList[i]);

  }
  return hexList ;
}

void main(){
  DateTime time1 = DateTime.now();
  String a = "ngọc bích 200";
  List<String> output= [];
  output = convertStringtoHexString(a);
  final List<int> newList = output.map((e)=>int.parse(e)).toList();
  print("Bản rõ : ");
  ShowMatrix(newList,4);
  String TextKey = "nguyễn tâm";
  print("Khóa mã hóa : $TextKey");
  List<String> key =[];
  key = convertStringtoHexString(TextKey);
  final List<int> Key = key.map((e)=>int.parse(e)).toList();
  ShowMatrix(Key,4);
  List<int> state = MahoaAES(newList, Key, 4, 10);
  print("\nBản mã :");
  ShowMatrix(state,4);
  print("\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
  List<int> D = GiaimaAES(state,Key,4,10);
  print("\nGiai ma :");
  ShowMatrix(D,4);
  var decoded = utf8.decode(outputFunction(D));
  print(decoded);
  DateTime time2 = DateTime.now();
  print("\nTime of Process");
  double c = (time2.millisecond - time1.millisecond) / 1000;
  print(" $c");
  time2.subtract(Duration(seconds: time1.second,));
}
String hexJoin(String hex){
  return '0x' + hex;
}
List<int> outputFunction(List<int> D){
  List<String> newList =[];
  for(int i = 0 ; i < D.length ; i++){
    String hexString = D[i].toRadixString(16);
    List<String> splitted = [];
    for (int i = 0; i < hexString.length; i = i + 2) {
      splitted.add(hexJoin(hexString.substring(i, i + 2)));
    }
    newList = new List.from(newList)..addAll(splitted);
  }
  D = newList.map(int.parse).toList();
  return D;
}
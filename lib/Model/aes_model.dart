import 'package:flutter/material.dart';
List<int> bits = [128,192,256];
class AES_Model extends ChangeNotifier{
  late int Nr ;
  late int Nk ;
  int Nb = 4;
  late List<int> state;
  late List<int> Key;
  late String input;
  late String output;
  AES_Model({
   required this.Nr,
   required this.Nk, required this.state,
   required this.Key, required this.input,
    required this.output
});




}

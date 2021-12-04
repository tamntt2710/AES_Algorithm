class BitTypeEnum {
  static List<String> get bitListLabel{
    List<String> labels = [];
    for (var element in BitType.values){
      labels.add(element.label);
    }
    return labels;
  }  static List<BitType> get bitList{
    return BitType.values.toList();
  }
  static BitType getBitType(int id) {
    return BitType.values.where((value) => value.id == id).first;
  }
}

enum BitType { type128Bit, type192Bit, type256Bit }

extension BitTypeExtension on BitType {
  int get id {
    switch (this) {
      case BitType.type128Bit:
        return 0;
      case BitType.type192Bit:
        return 1;
      case BitType.type256Bit:
        return 2;
    }
  }
  String get label {
    switch (this) {
      case BitType.type128Bit:
        return '128 bit';
      case BitType.type192Bit:
        return '192 bit';
      case BitType.type256Bit:
        return '256 bit';
    }
  }
  int get limitLength {
    switch (this) {
      case BitType.type128Bit:
        return 16;
      case BitType.type192Bit:
        return 24;
      case BitType.type256Bit:
        return 32;
    }
  }
}

class EncodeTypeEnum {
  static List<String> get encodeListLabel{
    List<String> labels = [];
    for (var element in EncodeType.values){
      labels.add(element.label);
    }
    return labels;
  }  static List<EncodeType> get bitList{
    return EncodeType.values.toList();
  }
  static EncodeType getEncodeType(int id) {
    return EncodeType.values.where((value) => value.id == id).first;
  }
}

enum EncodeType { base64, hex }

extension EncodeTypeExtension on EncodeType {
  int get id {
    switch (this) {
      case EncodeType.base64:
        return 0;
      case EncodeType.hex:
        return 1;
    }
  }
  String get label {
    switch (this) {
      case EncodeType.base64:
        return 'Base64';
      case EncodeType.hex:
        return 'Hex';
    }
  }

}

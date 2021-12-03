import 'package:aes_algorithm/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension MapExtension on Map {
  Map removeNulls() => removeNullsFromMap(this);
}

extension ListExtension on List {
  List removeNulls() => removeNullsFromList(this);
}

Map<dynamic, dynamic> removeNullsFromMap(Map<dynamic, dynamic> json) => json
  ..removeWhere((dynamic key, dynamic value) => value == null)
  ..map<dynamic, dynamic>((key, value) => MapEntry(key, removeNulls(value)));

List removeNullsFromList(List list) => list
  ..removeWhere((value) => value == null)
  ..map((e) => removeNulls(e)).toList();

removeNulls(e) => (e is List)
    ? removeNullsFromList(e)
    : (e is Map ? removeNullsFromMap(e) : e);

extension Typing<T> on List<T> {
  /// Provide access to the generic type at runtime.
  Type get genericType => T;
}

extension SubmitDataExtension on SubmitDataState {
  String get text {
    switch (this) {
      case SubmitDataState.create:
        return ConstantsUtils.ADD;
      case SubmitDataState.update:
        return ConstantsUtils.UPDATE;
      case SubmitDataState.delete:
        return ConstantsUtils.DELETE;
      default:
        return '';
    }
  }
}

extension GlobalKeyExtension on GlobalKey {
  double get globalPosition {
    RenderBox renderBox = currentContext!.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    final yPosition = offset.dy;
    return yPosition - Get.statusBarHeight;
  }

  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject!.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

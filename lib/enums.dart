import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

class Option<T> {
  final String label;
  final T value;
  final String? icon;
  final Color? color;
  EdgeInsets? padding;

  Option({required this.label, required this.value, this.icon, this.color, this.padding});
}

enum BookStatus {
  InLibrary,
  Booked,
  OutOfLibrary;

  String convertToString() {
    return EnumToString.convertToString(this);
  }

  String toName() {
    switch (this) {
      case Booked:
        return 'Резерв';
      case OutOfLibrary:
        return 'На руках';
      case InLibrary:
        return 'В библиотеке';
    }
  }
}

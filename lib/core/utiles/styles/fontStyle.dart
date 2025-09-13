import 'package:flutter/material.dart';

class FontStyle {
  factory FontStyle() {
    return _instance;
  }
  FontStyle._internal();
  static final FontStyle _instance = FontStyle._internal();
  static const TextStyle f16w400gray = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
  static const TextStyle hinterror = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
  static const TextStyle f25w500black = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle f16w500black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle f11w400grey = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}

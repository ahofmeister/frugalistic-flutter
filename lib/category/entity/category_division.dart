import 'package:flutter/material.dart';

enum CategoryDivision {
  essentials(Color(0xFF2a9d8f)),
  leisure(Color(0xFFe76f51)),
  savings(Color(0xFFe9c46a));

  final Color _color;

  const CategoryDivision(this._color);

  Color get color => _color;
}

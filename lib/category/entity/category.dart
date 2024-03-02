import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_division.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@Freezed(fromJson: true, toJson: true)
class Category with _$Category {
  factory Category({
    int? id,
    required String name,
    required CategoryDivision division,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'entity/category.dart';

part 'categories_provider.g.dart';

@riverpod
class Categories extends _$Categories {
  @override
  Future<List<Category>> build() async {
    List<Map<String, dynamic>> response = await Supabase.instance.client.from("categories").select("*");
    return response.map((e) => Category.fromJson(e)).toList();
  }

  Future<void> addTransaction(Category category) async {
    await Supabase.instance.client.from("categories").insert({
      "user_id": Supabase.instance.client.auth.currentUser!.id,
      "name": category.name,
    });
    ref.invalidateSelf();
  }
}

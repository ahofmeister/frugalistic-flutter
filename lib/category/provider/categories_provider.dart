import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../entity/category.dart';

part 'categories_provider.g.dart';

@Riverpod(keepAlive: true)
class Categories extends _$Categories {
  @override
  Future<List<Category>> build() async {
    List<Map<String, dynamic>> response = await Supabase.instance.client
        .from("categories")
        .select("*")
        .order("division", ascending: true);
    return response.map((e) => Category.fromJson(e)).toList();
  }

  Future<void> editCategory(Category editedCategory) async {
    final values = {
      if (editedCategory.id != null) "id": editedCategory.id,
      "user_id": Supabase.instance.client.auth.currentUser!.id,
      "name": editedCategory.name,
      "division": editedCategory.division.name,
    };

    await Supabase.instance.client.from("categories").upsert(values);
    ref.invalidateSelf();
  }

  Future<void> deleteCategory(Category category) async {
    if (category.id != null) {
      await Supabase.instance.client.from("categories").delete().eq("id", category.id.toString());
      ref.invalidateSelf();
    }
  }
}

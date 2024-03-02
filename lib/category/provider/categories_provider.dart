import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../entity/category.dart';

part 'categories_provider.g.dart';

@riverpod
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
    var res = await Supabase.instance.client.from("categories").upsert({
      "id": editedCategory.id,
      "user_id": Supabase.instance.client.auth.currentUser!.id,
      "name": editedCategory.name,
      "division": editedCategory.division.name
    });
    print(res);
    ref.invalidateSelf();
  }
}

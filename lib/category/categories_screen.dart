import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/category/provider/categories_provider.dart';

import 'entity/category.dart';
import 'entity/category_division.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categories = ref.watch(categoriesProvider);

    if (categories.isLoading) {
      return Text("Loading");
    }

    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemCount: categories.value!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(categories.value![index].name),
                subtitle: Text(categories.value![index].division.name),
                onTap: () {
                  // Navigate to edit category screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditCategoryScreen(category: categories.value![index]),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Delete the category from the provider
                    ref.watch(categoriesProvider.notifier).deleteCategory(categories.value![index]);
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to add category screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddCategoryScreen(),
                ),
              );
            },
            child: Text('Add Category'),
          ),
        ],
      ),
    );
  }
}


class AddCategoryScreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  CategoryDivision selectedDivision = CategoryDivision.essentials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            SizedBox(height: 16),
            DropdownButton<CategoryDivision>(
              value: selectedDivision,
              onChanged: (CategoryDivision? newValue) {
                if (newValue != null) {
                  selectedDivision = newValue;
                }
              },
              items: CategoryDivision.values.map((division) {
                return DropdownMenuItem<CategoryDivision>(
                  value: division,
                  child: Text(division.name),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the category to the provider
                final category = Category(
                  name: nameController.text,
                  division: selectedDivision,
                );
                ref.watch(categoriesProvider.notifier).editCategory(category);

                // Navigate back to the main screen
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditCategoryScreen extends ConsumerWidget {
  final Category category;

  EditCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController =
    TextEditingController(text: category.name);

    CategoryDivision selectedDivision = category.division;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            SizedBox(height: 16),
            DropdownButton<CategoryDivision>(
              value: selectedDivision,
              onChanged: (CategoryDivision? newValue) {
                if (newValue != null) {
                  selectedDivision = newValue;
                }
              },
              items: CategoryDivision.values.map((division) {
                return DropdownMenuItem<CategoryDivision>(
                  value: division,
                  child: Text(division.name),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the edited category to the provider
                final editedCategory = Category(
                  id: category.id,
                  name: nameController.text,
                  division: selectedDivision,
                );
                ref.watch(categoriesProvider.notifier).editCategory(editedCategory);

                // Navigate back to the main screen
                Navigator.of(context).pop();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}


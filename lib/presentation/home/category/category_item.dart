import 'package:flutter/material.dart';

import '../../../remote/models/category_model.dart';
import '../../common/app_solid_button.dart';
import '../../products/product_list_page.dart';

class CategoryItem extends StatelessWidget {
  final TextDirection direction;
  final CategoryModel categoryModel;

  const CategoryItem(
      {Key? key, required this.direction, required this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Row(
        textDirection: direction,
        children: [
          Image.asset(
            categoryModel.imageUrl.toString(),
            width: 150,
            height: 150,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  categoryModel.name.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  categoryModel.description.toString(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                AppSolidButton(
                  text: categoryModel.key.toString(),
                  onPressed: () => _categorySelected(context, categoryModel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _categorySelected(BuildContext context, CategoryModel model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListPage(
          categoryId: model.categoryId.toString(),
          categoryName: model.name.toString(),
        ),
      ),
    ).then((value) => _checkCartCount());
  }

  void _checkCartCount() {}
}

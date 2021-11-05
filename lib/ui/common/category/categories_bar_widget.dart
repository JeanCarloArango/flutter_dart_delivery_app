import 'package:delivery_app/model/categories.dart';
import 'package:delivery_app/ui/common/category/category_box_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({Key? key}) : super(key: key);

  final cats = categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: screenHeight(context) * 0.05,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cats.length,
          itemBuilder: (context, index) {
            final category = cats[index];
            return CategoryBoxWidget(
              text: category,
            );
          },
        ),
      ),
    );
  }
}

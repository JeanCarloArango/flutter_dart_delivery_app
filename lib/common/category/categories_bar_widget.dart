import 'package:delivery_app/common/category/category_box_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  void filterCategory() {
    print('works');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: screenHeight(context) * 0.05,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CategoryBoxWidget(
              'Food',
              () => filterCategory(),
            ),
          ],
        ),
      ),
    );
  }
}

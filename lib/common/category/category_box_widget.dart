import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/common/category/categories_bar_widget.dart';
import 'package:flutter/material.dart';

class CategoryBoxWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  CategoryBoxWidget(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[300],
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Center(
        child: AutoSizeText(
          text,
          style: TextStyle(
            fontSize: 20,
          ),
          maxLines: 1,
          maxFontSize: 25,
          minFontSize: 10,
        ),
      ),
    );
  }
}

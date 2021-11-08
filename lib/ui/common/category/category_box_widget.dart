import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class CategoryBoxWidget extends StatelessWidget {
  final String text;

  final bd = BussinessDao();

  // void handleFilter(String category) {
  //   bd.filterBussiness(category);
  // }

  CategoryBoxWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   handleFilter(text);
      // },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[300],
        ),
        width: screenWidth(context) * 0.3,
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
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CategoryBoxWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const CategoryBoxWidget(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            AutoSizeText(
              text,
              style: TextStyle(
                fontSize: 20,
              ),
              maxLines: 1,
              maxFontSize: 25,
              minFontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}

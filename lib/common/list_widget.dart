import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final String title;
  final IconData rowIcon;
  final IconData? rowIconOp;

  final VoidCallback onTap;

  ListWidget(this.title, this.rowIcon, this.rowIconOp, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Row(
              children: [
                Icon(
                  rowIcon,
                  size: 30,
                ),
                Icon(
                  rowIconOp,
                  size: 20,
                ),
              ],
            ),
            Expanded(
              child: AutoSizeText(
                title,
                style: const TextStyle(
                  fontSize: 24,
                ),
                maxLines: 2,
                minFontSize: 10,
                maxFontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

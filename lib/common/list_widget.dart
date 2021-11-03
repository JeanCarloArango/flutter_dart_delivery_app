import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final String title;
  final IconData rowIcon;
  final IconData? rowIconOp;

  ListWidget(this.title, this.rowIcon, this.rowIconOp);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(
                  rowIcon,
                  size: 40,
                ),
                Icon(
                  rowIconOp,
                  size: 30,
                ),
              ],
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

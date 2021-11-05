import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;

  const ActionButton(this.label);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: ElevatedButton(
        onPressed: () {},
        child: AutoSizeText(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          maxFontSize: 20,
          minFontSize: 10,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainColor),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final String placeholder;

  const TextFieldWidget(this.icon, this.placeholder);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: TextField(
          style: TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: placeholder,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

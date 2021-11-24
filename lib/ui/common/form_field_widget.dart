import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:flutter/material.dart';

class Form_field extends StatelessWidget {
  const Form_field(
      {Key? key,
      required this.text,
      required this.placeholder,
      required this.callback});

  final String text;
  final String placeholder;
  final VoidCallback callback;

  String getCallBack(String val) {
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return text;
        } else {
          getCallBack(value);
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }
}

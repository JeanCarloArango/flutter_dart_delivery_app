import 'package:delivery_app/ui/home_page.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  void ET(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: mainColor,
      child: Icon(Icons.home),
      onPressed: () => ET(context),
    );
  }
}

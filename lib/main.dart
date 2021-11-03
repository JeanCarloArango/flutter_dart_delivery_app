import 'package:delivery_app/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        fontFamily: 'Arvo',
      ),
      home: HomePage(),
    );
  }
}

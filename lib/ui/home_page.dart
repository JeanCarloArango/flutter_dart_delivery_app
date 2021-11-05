// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AutoSizeText(
          'Menu Principal',
          maxLines: 1,
          maxFontSize: 25,
          minFontSize: 10,
        ),
      ),
      drawer: MenuWidget(),
      body: Stack(
        children: [
          Positioned.fill(
            child: FittedBox(
              child: Image.asset('assets/welcome.gif'),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

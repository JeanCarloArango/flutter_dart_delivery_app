import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
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

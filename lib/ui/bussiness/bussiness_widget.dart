import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/common/menu_widget.dart';
import 'package:delivery_app/ui/home_page.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class BussinessWidget extends StatelessWidget {
  const BussinessWidget({Key? key}) : super(key: key);

  void ET() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        title: const AutoSizeText(
          'Negocios Registrados',
          style: TextStyle(
            fontSize: 25,
          ),
          maxFontSize: 30,
          minFontSize: 20,
        ),
        backgroundColor: mainColor,
      ),
      drawer: MenuWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: const Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        },
      ),
    );
  }
}

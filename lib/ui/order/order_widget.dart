import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:delivery_app/ui/common/home_button.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final db = BussinessDao();

  @override
  void initState() {
    db.requestBussiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context) * 0.07,
        title: const AutoSizeText(
          'Agregar Pedido',
          style: TextStyle(
            fontSize: 25,
          ),
          maxLines: 1,
          maxFontSize: 30,
          minFontSize: 20,
        ),
        backgroundColor: mainColor,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: screenWidth(context) * 0.8),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fastfood_outlined,
                        size: screenWidth(context) * 0.4,
                      ),
                      Icon(
                        Icons.add,
                        size: screenWidth(context) * 0.2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: db.loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        )
                      : Column(
                          children: [],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: HomeButton(),
    );
  }
}

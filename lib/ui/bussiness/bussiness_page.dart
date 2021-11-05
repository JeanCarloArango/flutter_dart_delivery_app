import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:delivery_app/ui/bussiness/bussiness_item_widget.dart';
import 'package:delivery_app/ui/common/category/categories_bar_widget.dart';
import 'package:delivery_app/ui/common/home_button.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:delivery_app/ui/common/text_field_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class BussinessWidget extends StatefulWidget {
  const BussinessWidget({Key? key}) : super(key: key);

  @override
  State<BussinessWidget> createState() => _BussinessWidgetState();
}

class _BussinessWidgetState extends State<BussinessWidget> {
  final bd = BussinessDao();

  void showBussinessInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Negocios Registrados',
          style: TextStyle(
            fontSize: 25,
          ),
          maxLines: 1,
          maxFontSize: 25,
          minFontSize: 10,
        ),
        backgroundColor: mainColor,
      ),
      drawer: MenuWidget(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFieldWidget(
              Icons.search,
              'Buscar Negocio',
            ),
            CategoriesWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: bd.bussinesses.length,
                itemBuilder: (context, index) {
                  final b = bd.bussinesses[index];
                  return BussinessItemWidget(
                    b,
                    () => showBussinessInfo(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: HomeButton(),
    );
  }
}

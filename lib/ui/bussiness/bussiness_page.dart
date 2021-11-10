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
  BussinessWidget({Key? key}) : super(key: key);

  @override
  State<BussinessWidget> createState() => _BussinessWidgetState();
}

class _BussinessWidgetState extends State<BussinessWidget> {
  final bd = BussinessDao();

  @override
  void initState() {
    bd.requestBussiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bd,
      builder: (context, child) {
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
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                      return BussinessItemWidget(b);
                    },
                  ),
                ),
                if (bd.loading)
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
          floatingActionButton: HomeButton(),
        );
      },
    );
  }
}

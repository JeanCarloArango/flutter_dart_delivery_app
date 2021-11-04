import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/common/list_widget.dart';
import 'package:delivery_app/ui/bussiness/bussiness_page.dart';
import 'package:delivery_app/ui/customer/add_customer_page.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  void goBussiness(BuildContext c) {
    Navigator.of(c).push(
      MaterialPageRoute(
        builder: (_) => BussinessWidget(),
      ),
    );
  }

  void goAddCstmr(BuildContext c) {
    Navigator.of(c).push(
      MaterialPageRoute(
        builder: (_) => AddCustomerForm(),
      ),
    );
  }

  void goUpCstmr(BuildContext c) {}

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: borderRadius,
        bottomRight: borderRadius,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Center(
                  child: AutoSizeText(
                    'Menu Principal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                    maxLines: 1,
                    minFontSize: 25,
                    maxFontSize: 35,
                  ),
                ),
                decoration: BoxDecoration(
                  color: mainColor,
                ),
              ),
              ListWidget(
                'Negocios Registrados',
                Icons.assignment_rounded,
                null,
                () => goBussiness(context),
              ),
              ListWidget(
                'Registrar Clientes',
                Icons.person_add_alt_1,
                null,
                () => goAddCstmr(context),
              ),
              ListWidget(
                'Actualizar Cliente',
                Icons.person,
                Icons.create,
                () => goUpCstmr(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

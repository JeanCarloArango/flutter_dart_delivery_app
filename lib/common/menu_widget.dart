import 'package:delivery_app/common/list_widget.dart';
import 'package:delivery_app/ui/bussiness/bussiness_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  void goBussiness(BuildContext c) {
    Navigator.of(c).push(
      MaterialPageRoute(
        builder: (_) => const BussinessWidget(),
      ),
    );
  }

  void goAddCstmr() {}

  void goUpCstmr() {}

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: borderRadius,
        bottomRight: borderRadius,
      ),
      child: SizedBox(
        width: 400,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: const Center(
                  child: Text(
                    'Menu Principal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Arvo',
                    ),
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
                () => goAddCstmr(),
              ),
              ListWidget(
                'Actualizar Cliente',
                Icons.person,
                Icons.create,
                () => goUpCstmr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

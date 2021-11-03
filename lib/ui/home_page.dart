// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery_app/common/list_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
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
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
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
                  child: Center(
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
                    color: Colors.amber[900],
                  ),
                ),
                ListWidget(
                    'Negocios Registrados', Icons.assignment_rounded, null),
                ListWidget(
                  'Registrar Clientes',
                  Icons.person_add_alt_1,
                  null,
                ),
                ListWidget(
                  'Actualizar Cliente',
                  Icons.person,
                  Icons.create,
                ),
              ],
            ),
          ),
        ),
      ),
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

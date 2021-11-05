import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/common/action_button.dart';
import 'package:delivery_app/common/menu_widget.dart';
import 'package:delivery_app/common/text_field_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class UpdateCustomerForm extends StatelessWidget {
  const UpdateCustomerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context) * 0.07,
        title: AutoSizeText(
          'Actualizar Cliente',
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
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: screenWidth(context) * 0.4,
                      ),
                      Icon(
                        Icons.create,
                        size: screenWidth(context) * 0.2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      TextFieldWidget(null, 'Nombre:'),
                      ActionButton('Consultar'),
                      SizedBox(
                        height: screenHeight(context) * 0.02,
                      ),
                      TextFieldWidget(null, 'Direccion:'),
                      SizedBox(
                        height: screenHeight(context) * 0.01,
                      ),
                      TextFieldWidget(null, 'Telefono:'),
                      SizedBox(
                        height: screenHeight(context) * 0.01,
                      ),
                      TextFieldWidget(null, 'Celular:'),
                      SizedBox(
                        height: screenHeight(context) * 0.01,
                      ),
                      ActionButton('Actualizar'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

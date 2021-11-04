import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/common/home_button.dart';
import 'package:delivery_app/common/menu_widget.dart';
import 'package:delivery_app/common/text_field_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class AddCustomerForm extends StatelessWidget {
  const AddCustomerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        title: AutoSizeText(
          'Registrar Cliente',
          style: TextStyle(
            fontSize: 25,
          ),
          maxFontSize: 30,
          minFontSize: 20,
        ),
        backgroundColor: mainColor,
      ),
      drawer: MenuWidget(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.person_add_alt_1,
                size: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ListView(
                  children: [
                    TextFieldWidget(null, 'Nombre:'),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(null, 'Direccion:'),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(null, 'Telefono:'),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(null, 'Celular:'),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: AutoSizeText(
                              'Registrar',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              maxFontSize: 25,
                              minFontSize: 15,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(mainColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: HomeButton(),
    );
  }
}

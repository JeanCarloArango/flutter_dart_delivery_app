import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class AddFormWidget extends StatefulWidget {
  const AddFormWidget({Key? key});

  @override
  _AddFormWidgetState createState() => _AddFormWidgetState();
}

class _AddFormWidgetState extends State<AddFormWidget> {
  final _formK = GlobalKey<FormState>();

  final dao = BussinessDao();
  var _name;
  var _address;
  var _phone;
  var _celphone;

  TextStyle hStyle = TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formK,
      child: ListView(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nombre no es valido';
              } else {
                setState(() {
                  _name = value;
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Nombre: ',
              hintStyle: hStyle,
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Dirección no es valida';
              } else {
                setState(() {
                  _address = value;
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Dirección: ',
              hintStyle: hStyle,
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Teléfono no es valido';
              } else {
                setState(() {
                  _phone = value;
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Teléfono: ',
              hintStyle: hStyle,
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Celular no es valido';
              } else {
                setState(() {
                  _celphone = value;
                });
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Celular: ',
              hintStyle: hStyle,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formK.currentState!.validate()) {
                String data = '$_name;$_address;$_phone;$_celphone';
                dao.insert(data, 'Customers');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: AutoSizeText(
                      'Cliente $_name registrado',
                      style: TextStyle(fontSize: 30),
                      maxFontSize: 30,
                      minFontSize: 20,
                      maxLines: 1,
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: AutoSizeText(
                      'Cliente $_name no pudo ser registrado',
                      style: TextStyle(fontSize: 30),
                      maxFontSize: 30,
                      minFontSize: 20,
                      maxLines: 1,
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const AutoSizeText(
              'Enviar',
              style: TextStyle(fontSize: 25),
              maxFontSize: 25,
              maxLines: 1,
              minFontSize: 20,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(mainColor),
            ),
          ),
        ],
      ),
    );
  }
}

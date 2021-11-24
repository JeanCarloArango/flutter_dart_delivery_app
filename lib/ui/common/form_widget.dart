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

  BussinessDao dao = BussinessDao();
  var _name;
  var _address;
  var _phone;
  var _celphone;

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
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formK.currentState!.validate()) {
                String data = '$_name;$_address;$_phone;$_celphone';
                dao.insert(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Cliente $_name registrado',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: const Text('Enviar'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(mainColor),
            ),
          ),
        ],
      ),
    );
  }
}

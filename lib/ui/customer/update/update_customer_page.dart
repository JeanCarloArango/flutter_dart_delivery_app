import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:delivery_app/ui/common/home_button.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class UpdateCustomerForm extends StatefulWidget {
  const UpdateCustomerForm({Key? key}) : super(key: key);

  @override
  State<UpdateCustomerForm> createState() => _UpdateCustomerFormState();
}

class _UpdateCustomerFormState extends State<UpdateCustomerForm> {
  final dao = BussinessDao();
  var _updateKey = GlobalKey<FormState>();
  var _queryKey = GlobalKey<FormState>();
  var _dni;
  var _address;
  var _phone;
  var _celphone;
  TextStyle hStyle = TextStyle(
    fontSize: 20,
  );
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
                  child: Form(
                    key: _queryKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Identificación no es valida';
                            } else {
                              setState(() {
                                _dni = value;
                              });
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Cedula: ',
                            hintStyle: hStyle,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_queryKey.currentState!.validate()) {
                              int count = await dao.filterCustomer(_dni);
                              if (count > 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: AutoSizeText(
                                      'Cliente $_dni encontrado',
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
                                      'Cliente $_dni no pudo ser encontrado',
                                      style: TextStyle(fontSize: 30),
                                      maxFontSize: 30,
                                      minFontSize: 20,
                                      maxLines: 1,
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          child: AutoSizeText(
                            'Consultar',
                            style: TextStyle(fontSize: 25),
                            maxFontSize: 21,
                            maxLines: 1,
                            minFontSize: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context) * 0.02,
                        ),
                        Form(
                          key: _updateKey,
                          child: Column(
                            children: [
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
                              SizedBox(
                                height: screenHeight(context) * 0.01,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Telefono no es valido';
                                  } else {
                                    setState(() {
                                      _phone = value;
                                    });
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Telefono: ',
                                  hintStyle: hStyle,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.01,
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
                              SizedBox(
                                height: screenHeight(context) * 0.01,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_updateKey.currentState!.validate()) {
                                    String data =
                                        '$_dni;$_address;$_phone;$_celphone';
                                    bool res = await dao.updateCustomer(data);
                                    if (res) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: AutoSizeText(
                                            'Cliente $_dni Fue actualizado',
                                            style: TextStyle(fontSize: 30),
                                            maxFontSize: 30,
                                            minFontSize: 20,
                                            maxLines: 1,
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: AutoSizeText(
                                            'Cliente $_dni no pudo ser actualizado',
                                            style: TextStyle(fontSize: 30),
                                            maxFontSize: 30,
                                            minFontSize: 20,
                                            maxLines: 1,
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: AutoSizeText(
                                    'Actualizar',
                                    style: TextStyle(fontSize: 25),
                                    maxFontSize: 21,
                                    maxLines: 1,
                                    minFontSize: 20,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

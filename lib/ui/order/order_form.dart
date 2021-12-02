import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/ui_constants.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final db = BussinessDao();
  final _orderK = GlobalKey<FormState>();
  String? _dropdownBussValue;
  String? _dropdownPrValue;
  var _cstmrDni;
  var _bussinessName;
  var _productSelected;
  var _quantity;
  int? _total;

  @override
  void initState() {
    db.requestBussiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: db,
      builder: (context, child) {
        return db.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Form(
                  key: _orderK,
                  child: ListView(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Identificacion no es valida';
                          } else {
                            setState(
                              () {
                                _cstmrDni = value;
                              },
                            );
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Identificacion de Cliente: ',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'No has escogido un Negocio';
                          } else {
                            setState(
                              () {
                                _bussinessName = value;
                              },
                            );
                          }
                          return null;
                        },
                        isExpanded: true,
                        items: db.itemName.map<DropdownMenuItem<String>>(
                          (String value) {
                            // print(value);
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: AutoSizeText(
                                  value,
                                  style: TextStyle(fontSize: 20),
                                  maxFontSize: 20,
                                  maxLines: 1,
                                  minFontSize: 15,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              _dropdownBussValue = newValue!;
                              _dropdownPrValue = null;
                              db.getProducts(newValue);
                            },
                          );
                        },
                        value: _dropdownBussValue,
                        hint: Center(
                          child: AutoSizeText(
                            '-- Selecciona Negocio --',
                            style: TextStyle(fontSize: 20),
                            maxFontSize: 20,
                            maxLines: 1,
                            minFontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        isExpanded: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'No has escogido un Producto';
                          } else {
                            setState(
                              () {
                                _productSelected = value.split("-")[1];
                              },
                            );
                          }
                          return null;
                        },
                        items: db.products.map<DropdownMenuItem<String>>(
                          (String value) {
                            // print(value);
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: AutoSizeText(
                                  value,
                                  style: TextStyle(fontSize: 20),
                                  maxFontSize: 20,
                                  maxLines: 1,
                                  minFontSize: 15,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropdownPrValue = newValue!;
                          });
                        },
                        hint: Center(
                          child: AutoSizeText(
                            '-- Selecciona Producto --',
                            style: TextStyle(fontSize: 20),
                            maxFontSize: 20,
                            maxLines: 1,
                            minFontSize: 15,
                          ),
                        ),
                        value: _dropdownPrValue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Dirección no es valida';
                          } else {
                            setState(
                              () {
                                _quantity = value;
                              },
                            );
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value == null || value.isEmpty) {
                            value = '0';
                          }
                          print(value);
                          setState(
                            () {
                              _total =
                                  int.parse(_dropdownPrValue!.split('-')[3]) *
                                      int.parse(value);
                            },
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Cantidad: ',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            'Total:',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            maxFontSize: 25,
                            maxLines: 1,
                            minFontSize: 20,
                          ),
                          AutoSizeText(
                            '\$',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            maxFontSize: 25,
                            maxLines: 1,
                            minFontSize: 20,
                          ),
                          _total == null
                              ? AutoSizeText(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  maxFontSize: 25,
                                  maxLines: 1,
                                  minFontSize: 20,
                                )
                              : AutoSizeText(
                                  _total.toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  maxFontSize: 25,
                                  maxLines: 1,
                                  minFontSize: 20,
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_orderK.currentState!.validate()) {
                            String data =
                                '$_cstmrDni;$_bussinessName;$_productSelected;$_quantity;$_total';
                            db.insert(data, 'Orders');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  child: AutoSizeText(
                                    'Pedido registrado',
                                    style: TextStyle(fontSize: 25),
                                    maxFontSize: 25,
                                    minFontSize: 20,
                                    maxLines: 1,
                                  ),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  child: AutoSizeText(
                                    'El pedido no pudo ser registrado',
                                    style: TextStyle(fontSize: 25),
                                    maxFontSize: 25,
                                    minFontSize: 20,
                                    maxLines: 1,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: AutoSizeText(
                            'Realizar Pedido',
                            style: TextStyle(fontSize: 25),
                            maxFontSize: 25,
                            maxLines: 1,
                            minFontSize: 20,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(mainColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

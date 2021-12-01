import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:delivery_app/ui/common/home_button.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:delivery_app/ui/common/text_field_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final _orderK = GlobalKey<FormState>();
  final db = BussinessDao();
  String? _dropdownBussValue;
  String? _dropdownPrValue;
  var _quantity;
  var _cstmrDni;

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
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: screenHeight(context) * 0.07,
              title: const AutoSizeText(
                'Agregar Pedido',
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
              child: Form(
                key: _orderK,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fastfood_outlined,
                              size: screenWidth(context) * 0.4,
                            ),
                            Icon(
                              Icons.add,
                              size: screenWidth(context) * 0.2,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: db.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: ListView(
                                  children: [
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Dirección no es valida';
                                        } else {
                                          setState(() {
                                            _quantity = value;
                                          });
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
                                      isExpanded: true,
                                      items: db.itemName
                                          .map<DropdownMenuItem<String>>(
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
                                          _dropdownBussValue = newValue!;
                                          _dropdownPrValue = null;
                                          db.getProducts(newValue);
                                        });
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
                                      items: db.products
                                          .map<DropdownMenuItem<String>>(
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
                                      value: _dropdownPrValue,
                                      hint: Center(
                                        child: AutoSizeText(
                                          '-- Selecciona Producto --',
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
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Dirección no es valida';
                                        } else {
                                          setState(() {
                                            _quantity = value;
                                          });
                                        }
                                        return null;
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText(
                                          'Total:',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                          maxFontSize: 25,
                                          maxLines: 1,
                                          minFontSize: 20,
                                        ),
                                        AutoSizeText(
                                          '\$',
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
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: const AutoSizeText(
                                          'Realizar Pedido',
                                          style: TextStyle(fontSize: 25),
                                          maxFontSize: 25,
                                          maxLines: 1,
                                          minFontSize: 20,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                mainColor),
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
        });
  }
}

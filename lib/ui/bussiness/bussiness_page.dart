import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:delivery_app/ui/bussiness/bussiness_item_widget.dart';
import 'package:delivery_app/ui/common/category/category_box_widget.dart';
import 'package:delivery_app/ui/common/home_button.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:delivery_app/ui/common/text_field_widget.dart';
import 'package:delivery_app/ui/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class BussinessWidget extends StatefulWidget {
  BussinessWidget({Key? key}) : super(key: key);

  @override
  State<BussinessWidget> createState() => _BussinessWidgetState();
}

class _BussinessWidgetState extends State<BussinessWidget> {
  final bd = BussinessDao();

  ConnectivityResult res = ConnectivityResult.none;
  bool connected = false;
  bool hasInternet = false;

  void checkConnection() async {
    res = await Connectivity().checkConnectivity();

    if (res == ConnectivityResult.wifi || res == ConnectivityResult.mobile) {
      connected = true;
    } else {
      connected = false;
    }
  }

  @override
  void initState() {
    checkConnection();
    InternetConnectionChecker().onStatusChange.listen(
      (status) {
        final hasInternet = status == InternetConnectionStatus.connected;
        setState(() {
          checkConnection();
          this.hasInternet = hasInternet;
        });
      },
    );
    bd.requestCategories();
    bd.requestBussiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bd,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: AutoSizeText(
              'Negocios Registrados',
              style: TextStyle(
                fontSize: 25,
              ),
              maxLines: 1,
              maxFontSize: 25,
              minFontSize: 10,
            ),
            backgroundColor: mainColor,
          ),
          drawer: MenuWidget(),
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                TextFieldWidget(
                  Icons.search,
                  'Buscar Negocio',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: screenHeight(context) * 0.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bd.categories.length,
                      itemBuilder: (context, index) {
                        final category = bd.categories[index];
                        // print(category.name);
                        return CategoryBoxWidget(
                          text: category.name,
                          onTap: () => bd.filterBussiness(category.name),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: bd.loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        )
                      : !connected
                          ? Center(
                              child: AutoSizeText(
                                'No Tienes Conexion a internet😥',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                maxFontSize: 20,
                                minFontSize: 15,
                                maxLines: 1,
                              ),
                            )
                          : ListView.builder(
                              itemCount: bd.bussinesses.length,
                              itemBuilder: (context, index) {
                                final b = bd.bussinesses[index];
                                return BussinessItemWidget(b);
                              },
                            ),
                ),
              ],
            ),
          ),
          floatingActionButton: HomeButton(),
        );
      },
    );
  }
}

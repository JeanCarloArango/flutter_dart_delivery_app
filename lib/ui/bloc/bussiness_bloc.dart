import 'package:delivery_app/model/bussiness.dart';
import 'package:delivery_app/persistence/bussiness_dao.dart';
import 'package:flutter/cupertino.dart';

class BussinessBloc extends ChangeNotifier {
  final bd = BussinessDao();

  List<Bussiness> bussinesses = [];
  List<Bussiness> fb = [];

  void requestBussiness() {
    bussinesses = bd.bussinesses;
  }

  List<Bussiness> getCities() {
    requestBussiness();
    filterBussiness('Herramientas');
    if (fb.isEmpty) {
      return bussinesses;
    }
    return fb;
  }

  void filterBussiness(String category) {
    for (Bussiness b in bussinesses) {
      if (b.category == category) {
        fb.add(b);
      }
    }
    // getCities();
  }
}

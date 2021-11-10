import 'package:delivery_app/model/bussiness.dart';
import 'package:delivery_app/persistence/data_constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BussinessDao extends ChangeNotifier {
  List<Bussiness> bussinesses = [];
  bool loading = false;

  void requestBussiness() async {
    loading = true;
    notifyListeners();

    var data = await http.get(
      Uri.parse(apiUrl),
    );
    var json = convert.jsonDecode(data.body) as List;
    bussinesses = json
        .map(
          (e) => Bussiness.fromJson(e),
        )
        .toList();

    loading = false;
    notifyListeners();
  }

  // final List<Bussiness> filter = [];

  // void filterBussiness(String category) {
  //   notifyListeners();
  //   Bussiness b;
  //   for (int i = 0; i < bussinesses.length; i++) {
  //     b = bussinesses[i];
  //     if (b.category == category) {
  //       filter.clear();
  //       filter.add(b);
  //       print(b.name);
  //     }
  //   }
  //   print(category);
  //   print('filtro $filter');
  // }
}

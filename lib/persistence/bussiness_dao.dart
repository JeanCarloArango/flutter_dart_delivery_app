import 'package:delivery_app/model/bussiness.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BussinessDao extends ChangeNotifier {
  
  List<Bussiness> bussinesses = [];

  requestData() async {
    var data = await http.get(
      Uri.parse(
          'https://script.google.com/macros/s/AKfycbzMZocxkhaZySd4HE9Zq4qZnZI-R7_ZKFxQ2hXRcIXZg3U289WenjfAeWMjun5mfn4H/exec'),
    );
    var json = convert.jsonDecode(data.body) as List;
    bussinesses = json
        .map(
          (e) => Bussiness.fromJson(e),
        )
        .toList();
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

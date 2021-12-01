import 'package:delivery_app/model/bussiness.dart';
import 'package:delivery_app/model/category.dart';
import 'package:delivery_app/persistence/data_constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BussinessDao extends ChangeNotifier {
  List<Bussiness> bussinesses = [];
  List<Category> categories = [];
  List<String> products = [];
  bool loading = false;
  List<String> acc = ['C', 'R', 'U', 'D', 'F'];
  String test = '';
  List<String> itemName = [];

  void requestBussiness() async {
    loading = true;
    notifyListeners();

    var data = await http.get(
      Uri.parse('$apiUrl${acc[1]}&tbl=Bussinesses'),
    );
    // print(data.body);
    var json = convert.jsonDecode(data.body);
    var bussinessData = json['data'] as List;
    bussinesses = bussinessData.map((e) => Bussiness.fromJson(e)).toList();
    // print(bussinesses);

    getBussinessData();

    loading = false;
    notifyListeners();
  }

  void requestCategories() async {
    loading = true;
    notifyListeners();

    var data = await http.get(
      Uri.parse('$apiUrl${acc[1]}&tbl=Categories'),
    );
    var json = convert.jsonDecode(data.body);
    // print(json);
    var categoryData = json['data'] as List;
    categories = categoryData.map((e) => Category.fromJson(e)).toList();

    loading = false;
    notifyListeners();
  }

  void filterBussiness(String category) async {
    loading = true;
    notifyListeners();

    for (var i = 0; i < categories.length; i++) {
      if (category == categories[0].name) {
        requestBussiness();
      }
    }

    var data = await http.get(
      Uri.parse('$apiUrl${acc[4]}&cat=$category'),
    );
    var json = convert.jsonDecode(data.body);
    // print(json);
    var bussinessData = json['data'] as List;
    bussinesses = bussinessData.map((e) => Bussiness.fromJson(e)).toList();

    loading = false;
    notifyListeners();
  }

  Future<String> insert(String data) async {
    loading = true;
    notifyListeners();

    var response = await http.get(
      Uri.parse('$apiUrl${acc[0]}&tbl=Customers&data=$data'),
    );

    if (response.statusCode == 200) {
      loading = false;
      notifyListeners();

      return response.body;
    } else {
      loading = false;
      notifyListeners();

      return 'Response status : ${response.statusCode}';
    }
  }

  void getBussinessData() {
    for (var i = 0; i < bussinesses.length; i++) {
      itemName.add(bussinesses[i].name);
    }
    // print(itemName);
  }

  List<String> getProducts(String? bName) {
    products = [];
    for (var i = 0; i < bussinesses.length; i++) {
      if (bussinesses[i].name == bName) {
        List<String> bPr = bussinesses[i].Products.split(';');
        for (var j = 0; j < bPr.length; j++) {
          products.add(bPr[j]);
        }
      }
    }
    // print(products);
    return products;
  }
}

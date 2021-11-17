import 'dart:convert';

import 'dart:ui';

Bussiness bussinessFromJson(String str) => Bussiness.fromJson(json.decode(str));

String bussinessToJson(Bussiness data) => json.encode(data.toJson());

class Bussiness {
  Bussiness({
    required this.name,
    required this.type,
    required this.description,
    required this.category,
    required this.LinkWeb,
    required this.Address,
    required this.Ubication,
    required this.Cellphone,
    required this.Phone,
    required this.Products,
    required this.Logo,
    required this.Images,
  });

  String name;
  String type;
  String description;
  String category;
  String LinkWeb;
  String Address;
  String Ubication;
  int Cellphone;
  int Phone;
  String Products;
  String Logo;
  String Images;

  factory Bussiness.fromJson(Map<String, dynamic> json) => Bussiness(
        name: json["Name"],
        type: json["Type"],
        description: json["Description"],
        category: json["Category"],
        LinkWeb: json["b_linkWeb"],
        Address: json["b_address"],
        Ubication: json["b_ubication"],
        Cellphone: json["b_celphone"],
        Phone: json["b_phone"],
        Products: json["b_productos"],
        Logo: json["b_logo"],
        Images: json['images'],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Type": type,
        "Description": description,
        "Category": category,
        "b_linkWeb": LinkWeb,
        "b_address": Address,
        "b_ubication": Ubication,
        "b_celphone": Cellphone,
        "b_phone": Phone,
        "b_productos": Products,
        "b_logo": Logo,
        "images": Images,
      };
}

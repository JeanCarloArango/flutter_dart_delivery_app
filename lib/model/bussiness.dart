class Bussiness {
  final String name;
  final String type;
  final String address;
  final String description;
  final String category;

  Bussiness({
    required this.name,
    required this.type,
    required this.address,
    required this.description,
    required this.category,
  });

  factory Bussiness.fromJson(dynamic json) {
    return Bussiness(
      name: json["Name"],
      type: json["Type"],
      address: json["Address"],
      description: json["Description"],
      category: json["Category"],
    );
  }

  Map toJson() => {
        'Name': name,
        'Type': type,
        'Address': address,
        'Description': description,
        'Category': category,
      };
}

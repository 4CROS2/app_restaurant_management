// To parse this JSON data, do
//
//     final stockModel = stockModelFromJson(jsonString);

import 'dart:convert';

StockModel stockModelFromJson(String str) =>
    StockModel.fromJson(json.decode(str));

String stockModelToJson(StockModel data) => json.encode(data.toJson());

class StockModel {
  String id;
  String name;
  String type;
  String description;
  double price;
  int quantity;

  StockModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.price,
    required this.quantity,
  });

  StockModel copyWith({
    String? id,
    String? name,
    String? type,
    String? description,
    double? price,
    int? quantity,
  }) =>
      StockModel(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
      );

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "description": description,
        "price": price,
        "quantity": quantity,
      };
}

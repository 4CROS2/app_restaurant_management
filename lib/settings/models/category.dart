// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  int id;
  String name;
  bool status;

  Category({
    required this.id,
    required this.name,
    required this.status,
  });

  Category copyWith({
    int? id,
    String? name,
    bool? status,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}

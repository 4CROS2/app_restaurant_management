// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String id;
  String name;
  bool status;

  CategoryModel({
    required this.id,
    required this.name,
    required this.status,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    bool? status,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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

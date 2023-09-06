// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  String id;
  String name;
  String email;
  String password;
  String cellphone;
  String rol;
  bool status;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.cellphone,
    required this.rol,
    required this.status,
  });

  EmployeeModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? cellphone,
    String? rol,
    bool? status,
  }) =>
      EmployeeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        cellphone: cellphone ?? this.cellphone,
        rol: rol ?? this.rol,
        status: status ?? this.status,
      );

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        cellphone: json["cellphone"],
        rol: json["rol"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "cellphone": cellphone,
        "rol": rol,
        "status": status,
      };
}

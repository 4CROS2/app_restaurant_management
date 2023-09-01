// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String id;
  DateTime date;
  String time;
  List<Product> products;
  double discount;
  String note;
  String status;
  String client;
  String typeOrder;
  int table;
  String address;
  String cellphone;
  double total;

  OrderModel({
    required this.id,
    required this.date,
    required this.time,
    required this.products,
    required this.discount,
    required this.note,
    required this.status,
    required this.client,
    required this.typeOrder,
    required this.table,
    required this.address,
    required this.cellphone,
    required this.total,
  });

  OrderModel copyWith({
    String? id,
    DateTime? date,
    String? time,
    List<Product>? products,
    double? discount,
    String? note,
    String? status,
    String? client,
    String? typeOrder,
    int? table,
    String? address,
    String? cellphone,
    double? total,
  }) =>
      OrderModel(
        id: id ?? this.id,
        date: date ?? this.date,
        time: time ?? this.time,
        products: products ?? this.products,
        discount: discount ?? this.discount,
        note: note ?? this.note,
        status: status ?? this.status,
        client: client ?? this.client,
        typeOrder: typeOrder ?? this.typeOrder,
        table: table ?? this.table,
        address: address ?? this.address,
        cellphone: cellphone ?? this.cellphone,
        total: total ?? this.total,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        discount: json["discount"]?.toDouble(),
        note: json["note"],
        status: json["status"],
        client: json["client"],
        typeOrder: json["typeOrder"],
        table: json["table"],
        address: json["address"],
        cellphone: json["cellphone"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "discount": discount,
        "note": note,
        "status": status,
        "client": client,
        "typeOrder": typeOrder,
        "table": table,
        "address": address,
        "cellphone": cellphone,
        "total": total,
      };
}

class Product {
  String nameProduct;
  double price;
  int cantidad;
  double total;

  Product({
    required this.nameProduct,
    required this.price,
    required this.cantidad,
    required this.total,
  });

  Product copyWith({
    String? nameProduct,
    double? price,
    int? cantidad,
    double? total,
  }) =>
      Product(
        nameProduct: nameProduct ?? this.nameProduct,
        price: price ?? this.price,
        cantidad: cantidad ?? this.cantidad,
        total: total ?? this.total,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        nameProduct: json["nameProduct"],
        price: json["price"]?.toDouble(),
        cantidad: json["cantidad"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nameProduct": nameProduct,
        "price": price,
        "cantidad": cantidad,
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String id;
  int idOrder;
  DateTime date;
  DateTime time;
  List<Product>? products;
  double discount;
  String note;
  String status;
  String client;
  String typeOrder;
  int table;
  String address;
  String cellphone;
  double total;
  String noteRejection;

  OrderModel({
    this.id = "",
    this.idOrder = 0,
    required this.date,
    required this.time,
    this.products,
    this.discount = 0,
    this.note = "",
    this.status = "",
    this.client = "",
    this.typeOrder = "",
    this.table = 0,
    this.address = "",
    this.cellphone = "",
    this.total = 0,
    this.noteRejection = "",
  });

  OrderModel copyWith({
    String? id,
    int? idOrder,
    DateTime? date,
    DateTime? time,
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
    String? noteRejection,
  }) =>
      OrderModel(
        id: id ?? this.id,
        idOrder: idOrder ?? this.idOrder,
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
        noteRejection: noteRejection ?? this.noteRejection,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        idOrder: json["idOrder"],
        date: DateTime.parse(json["date"]),
        time: DateTime.parse(json["time"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        discount: json["discount"]?.toDouble() ?? 0,
        note: json["note"] ?? "",
        status: json["status"],
        client: json["client"],
        typeOrder: json["typeOrder"],
        table: json["table"] ?? 0,
        address: json["address"] ?? "",
        cellphone: json["cellphone"] ?? "",
        total: json["total"]?.toDouble(),
        noteRejection: json["noteRejection"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idOrder": idOrder,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "discount": discount,
        "note": note,
        "status": status,
        "client": client,
        "typeOrder": typeOrder,
        "table": table,
        "address": address,
        "cellphone": cellphone,
        "total": total,
        "noteRejection": noteRejection,
      };
}

class Product {
  String nameProduct;
  double price;
  int quantity;
  double total;

  Product({
    required this.nameProduct,
    required this.price,
    required this.quantity,
    required this.total,
  });

  Product copyWith({
    String? nameProduct,
    double? price,
    int? quantity,
    double? total,
  }) =>
      Product(
        nameProduct: nameProduct ?? this.nameProduct,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        nameProduct: json["nameProduct"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nameProduct": nameProduct,
        "price": price,
        "quantity": quantity,
        "total": total,
      };
}

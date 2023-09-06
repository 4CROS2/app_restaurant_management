import 'package:app_restaurant_management/home/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  List<OrderModel> _listOrders = [];

  bool _loadingOrder = false;
  double _price = 0.0;

  bool get loadingOrder => _loadingOrder;
  set loadingOrder(bool state) {
    _loadingOrder = state;
    notifyListeners();
  }

  double get price => _price;
  set price(double state) {
    _price = state;
    notifyListeners();
  }

  List<OrderModel> get listOrder => _listOrders;
  set listOrder(List<OrderModel> list) {
    _listOrders = list;
    notifyListeners();
  }

  //metodo para crear una nueva orden
  Future<void> addOrder(
      int idOrder,
      List<Product> products,
      String status,
      String note,
      double discount,
      String client,
      String typeOrder,
      int table,
      String address,
      String cellphone,
      double total) async {
    var uuid = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      loadingOrder = true;
      await _db.collection("Order").doc(uuid).set(OrderModel(
            id: uuid,
            idOrder: idOrder,
            date: DateTime.now(),
            time: DateTime.now(),
            products: products,
            discount: discount,
            note: note,
            status: status,
            total: total,
            client: client,
            table: table,
            address: address,
            cellphone: cellphone,
            typeOrder: typeOrder,
          ).toJson());
      loadingOrder = false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para listar ordenes
  Future<void> getAllOrders() async {
    try {
      loadingOrder = true;
      var res = await _db.collection("Order").get();
      var info = res.docs.map((e) => OrderModel.fromJson(e.data())).toList();
      listOrder = info;
      loadingOrder = false;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para actualizar una orden
  Future<void> updateOrder(
    String status,
    String id,
    String noteRejection,
  ) async {
    try {
      loadingOrder = true;
      await _db.collection("Order").doc(id).update(OrderModel(
            date: DateTime.now(),
            time: DateTime.now(),
            status: status,
            noteRejection: noteRejection,
          ).toJson());
      loadingOrder = false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para eliminar orden
  Future<void> deleteOrder(var id) async {
    try {
      loadingOrder = true;
      _db.collection('Order').doc(id).delete();
      loadingOrder = false;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

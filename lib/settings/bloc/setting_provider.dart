import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  List<CategoryModel> _listCategory = [];

  bool _loadingCategories = false;

  bool get loadingCategories => _loadingCategories;
  set loadingCategories(bool state) {
    _loadingCategories = state;
    notifyListeners();
  }

  List<CategoryModel> get listCategory => _listCategory;
  set listCategory(List<CategoryModel> list) {
    _listCategory = list;
    notifyListeners();
  }

  //metodo para crear una nueva categoria
  Future<void> addCategory(String name, bool status) async {
    var uuid = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      await _db
          .collection("Categories")
          .doc(uuid)
          .set(CategoryModel(id: uuid, name: name, status: status).toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para listar categoria
  Future<void> getAllCategories() async {
    try {
      loadingCategories = true;
      var res = await _db.collection("Categories").get();
      var info = res.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
      listCategory = info;
      loadingCategories = false;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para eliminar categoria
  Future<void> deleteCategory(var id) async {
    try {
      loadingCategories = true;
      _db.collection('Categories').doc(id).delete();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

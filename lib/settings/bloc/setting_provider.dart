import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/settings/models/employee_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  // CATEGORIA

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
      loadingCategories = true;
      await _db
          .collection("Categories")
          .doc(uuid)
          .set(CategoryModel(id: uuid, name: name, status: status).toJson());
      loadingCategories = false;
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

  //metodo para actualizar una categoria
  Future<void> updateCategory(String id, String name, bool status) async {
    try {
      loadingCategories = true;
      await _db
          .collection("Categories")
          .doc(id)
          .update(CategoryModel(id: id, name: name, status: status).toJson());
      loadingCategories = false;
    } catch (e) {
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
      loadingCategories = false;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // EMPLEADO

  List<EmployeeModel> _listEmployees = [];

  bool _loadingEmployees = false;

  bool get loadingEmployees => _loadingEmployees;
  set loadingEmployees(bool state) {
    _loadingEmployees = state;
    notifyListeners();
  }

  List<EmployeeModel> get listEmployees => _listEmployees;
  set listEmployees(List<EmployeeModel> list) {
    _listEmployees = list;
    notifyListeners();
  }

  //metodo para crear usuario autentificado en firebase
  Future<void> newUser(String emailAddress, String password) async {
    try {
      // final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para crear un nuevo empleado
  Future<void> addEmployee(String name, String email, String password,
      String cellphone, String rol, bool status) async {
    var uuid = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      loadingEmployees = true;
      await _db.collection("Employees").doc(uuid).set(EmployeeModel(
              id: uuid,
              name: name,
              email: email,
              password: password,
              cellphone: cellphone,
              rol: rol,
              status: status)
          .toJson());
      await newUser(email, password);
      loadingEmployees = false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para listar empleados
  Future<void> getAllEmployees() async {
    try {
      loadingEmployees = true;
      var res = await _db.collection("Employees").get();
      var info = res.docs.map((e) => EmployeeModel.fromJson(e.data())).toList();
      listEmployees = info;
      loadingEmployees = false;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // EMPLEADO

  //metodo para actualizar un empleado
  Future<void> updateEmployee(String id, String name, String email,
      String password, String cellphone, String rol, bool status) async {
    try {
      loadingEmployees = true;
      await _db.collection("Employees").doc(id).update(EmployeeModel(
              id: id,
              name: name,
              email: email,
              password: password,
              cellphone: cellphone,
              rol: rol,
              status: status)
          .toJson());
      loadingEmployees = false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //metodo para eliminar empleado
  Future<void> deleteEmployee(var id) async {
    try {
      loadingEmployees = true;
      _db.collection('Employees').doc(id).delete();
      loadingEmployees = false;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

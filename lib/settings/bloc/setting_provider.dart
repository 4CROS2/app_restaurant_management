import 'package:app_restaurant_management/settings/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  Future<void> addCategory(String name, bool status) async {
    try {
      await _db.collection("Categories").doc().set(Category(
              id: DateTime.now().microsecondsSinceEpoch,
              name: name,
              status: status)
          .toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

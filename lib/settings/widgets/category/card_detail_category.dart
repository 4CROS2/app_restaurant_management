import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardDetailCategory extends StatelessWidget {
  final CategoryModel category;
  const CardDetailCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  Container nameCategory() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        category.name,
        style: textStyleItem,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container status() {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 5, right: 15),
      child: Text(
        category.status ? 'Activo' : 'Inactivo',
        style: category.status ? textStyleLabelGreen : textStyleLabelRed,
        textAlign: TextAlign.right,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 30, top: 5, left: 15, right: 15),
      decoration: boxShadow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          nameCategory(),
          status(),
        ],
      ),
    );
  }
}

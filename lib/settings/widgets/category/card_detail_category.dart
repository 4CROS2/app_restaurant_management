import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardDetailCategory extends StatefulWidget {
  const CardDetailCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDetailCategory> createState() => _CardDetailCategoryState();
}

class _CardDetailCategoryState extends State<CardDetailCategory> {
  Container nameCategory() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: const Text(
        'Alimentos',
        style: textStyleItem,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container status() {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 5, right: 15),
      child: const Text(
        'Activo',
        style: textStyleLabelGreen,
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

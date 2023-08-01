import 'package:app_restaurant_management/constans.dart';
import 'package:app_restaurant_management/home/widgets/new_order/card_product.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.only(bottom: 40),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        Container(
            margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
            child: const Text('Carnes de Res', style: textStyleTitle)),
        GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: (sw / 2 + (sw / 2) * 0.3) + 50,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 3),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const SectionCardProduct();
          },
        ),
      ],
    );
  }
}

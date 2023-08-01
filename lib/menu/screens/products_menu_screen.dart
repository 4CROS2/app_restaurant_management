import 'package:app_restaurant_management/menu/widgets/card_product.dart';
import 'package:flutter/material.dart';

class ProductsMenuScreen extends StatefulWidget {
  const ProductsMenuScreen({Key? key}) : super(key: key);

  @override
  State<ProductsMenuScreen> createState() => _ProductsMenuScreenState();
}

class _ProductsMenuScreenState extends State<ProductsMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CardProduct(
          price: 'Bs. 48',
          itemProduct:
              'Cuadril (200g) con ajo mantequilla y choclo para adultos',
          labelState: 'Disponible',
          description: 'Carne de res',
        );
      },
    );
  }
}

import 'package:app_restaurant_management/stock/widgets/card_stock.dart';
import 'package:flutter/material.dart';

class ProductsStockScreen extends StatefulWidget {
  const ProductsStockScreen({Key? key}) : super(key: key);

  @override
  _ProductsStockScreenState createState() => _ProductsStockScreenState();
}

class _ProductsStockScreenState extends State<ProductsStockScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CardStock(
          nameSale: 'Carne 20 Kilos',
          total: '12000',
        );
      },
    );
  }
}

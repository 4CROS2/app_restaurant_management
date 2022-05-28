import 'package:app_restaurant_management/sales/widgets/card_sale.dart';
import 'package:app_restaurant_management/sales/widgets/card_total.dart';
import 'package:flutter/material.dart';

class ListSalesScreen extends StatefulWidget {
  const ListSalesScreen({Key? key}) : super(key: key);

  @override
  _ListSalesScreenState createState() => _ListSalesScreenState();
}

class _ListSalesScreenState extends State<ListSalesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CardTotal(),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CardSale(
                id: '2',
                total: '40',
                nameSale: '1 kilo Carne',
                typeSale: 'ingreso',
                description: '1x Tablita\n2x Coca Colas');
          },
        ),
      ],
    );
  }
}

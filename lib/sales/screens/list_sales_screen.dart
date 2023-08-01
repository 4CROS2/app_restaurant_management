import 'package:app_restaurant_management/constans.dart';
import 'package:app_restaurant_management/sales/widgets/card_sale.dart';
import 'package:app_restaurant_management/sales/widgets/card_total.dart';
import 'package:flutter/material.dart';

class ListSalesScreen extends StatefulWidget {
  const ListSalesScreen({Key? key}) : super(key: key);

  @override
  State<ListSalesScreen> createState() => _ListSalesScreenState();
}

class _ListSalesScreenState extends State<ListSalesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        const CardTotal(),
        Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Hoy',
              style: TextStyle(fontSize: 16, color: fontGris),
            )),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
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

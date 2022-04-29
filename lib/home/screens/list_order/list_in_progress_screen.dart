import 'package:app_restaurant_management/home/widgets/orders/card_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({Key? key}) : super(key: key);

  @override
  _InProgressScreenState createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CardOrder(
          id: 'Orden #001',
          price: 'Bs. 48',
          name: 'Adela Canedo',
          labelState: 'Hace 10 min',
          colorState: yellowColor,
          description: '1x Tablita',
          statusOrder: 'inprogress',
        );
      },
    );
  }
}

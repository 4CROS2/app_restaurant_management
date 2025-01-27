import 'package:app_restaurant_management/home/widgets/orders/card_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CardOrder(
          id: 'Orden #001',
          typeOrder: "o",
          price: 'Bs. 48',
          name: 'Adela Canedo',
          labelState: 'Hace 10 min',
          colorState: redColor,
          description: '1x Tablita',
          statusOrder: 'pending',
        );
      },
    );
  }
}

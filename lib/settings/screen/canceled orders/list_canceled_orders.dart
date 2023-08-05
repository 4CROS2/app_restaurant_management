import 'package:app_restaurant_management/settings/widgets/canceled-orders/card_canceled_order.dart';
import 'package:flutter/material.dart';

class ListCanceledOrdersScreen extends StatefulWidget {
  const ListCanceledOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ListCanceledOrdersScreen> createState() =>
      _ListCanceledOrdersScreenState();
}

class _ListCanceledOrdersScreenState extends State<ListCanceledOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const CardOrderCancelled(
              id: 'Orden #121',
              typeOrder: 'typeOrder',
              price: 'Bs. 12',
              name: 'Cesar Aliaga',
              description: 'Pollo al espiedo',
            );
          },
        ),
      ],
    );
  }
}

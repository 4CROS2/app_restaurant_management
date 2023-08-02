import 'package:app_restaurant_management/settings/screen/canceled%20orders/list_canceled_orders.dart';
import 'package:flutter/material.dart';
import '../../../../../../constans.dart';

class CanceledOrdersScreen extends StatefulWidget {
  const CanceledOrdersScreen({Key? key}) : super(key: key);

  @override
  State<CanceledOrdersScreen> createState() => _CanceledOrdersScreenState();
}

class _CanceledOrdersScreenState extends State<CanceledOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: fontBlack,
          elevation: 0,
          backgroundColor: backgroundColor,
          title: const Text(
            'Ordenes Canceladas',
            style: textStyleTitle,
            textAlign: TextAlign.left,
          ),
        ),
        // ignore: prefer_const_constructors
        body: ListCanceledOrdersScreen(),
      ),
    );
  }
}

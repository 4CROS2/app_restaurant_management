import 'package:app_restaurant_management/home/widgets/button_cancel.dart';
import 'package:app_restaurant_management/home/widgets/button_confirm.dart';
import 'package:app_restaurant_management/home/widgets/card_confirm_order.dart';
import 'package:flutter/material.dart';
import '../../constans.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Confirmación de pedido",
          style: TextStyle(
            letterSpacing: 0.75,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            fontSize: fontSizeTitle,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        children: [
          const CardConfirm(),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCancel(textButton: 'Rechazar', onPressed: () {}),
                ButtonConfirm(textButton: 'En curso', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

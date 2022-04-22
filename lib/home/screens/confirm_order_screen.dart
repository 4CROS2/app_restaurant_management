import 'package:app_restaurant_management/home/widgets/button_cancel.dart';
import 'package:app_restaurant_management/home/widgets/button_confirm.dart';
import 'package:app_restaurant_management/home/widgets/card_confirm_order.dart';
import 'package:app_restaurant_management/home/widgets/modal_confirm.dart';
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
                ButtonCancel(
                  textButton: 'Rechazar',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          insetPadding:
                              const EdgeInsets.only(right: 10, left: 10),
                          child: ModalConfirm(
                              message: '¿Esta seguro de rechazar el pedido?',
                              textButtonConfirm: 'Si',
                              textButtonCancel: 'No',
                              onPressConfirm: () {},
                              onPressCancel: () {
                                Navigator.pop(context);
                              }),
                        );
                      },
                    );
                  },
                ),
                ButtonConfirm(
                  textButton: 'En curso',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: ModalConfirm(
                            message: 'Confirmar preparación',
                            image: 'assets/img/confirm-preparation.svg',
                            onPressConfirm: () {},
                            onPressCancel: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

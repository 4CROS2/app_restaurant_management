// ignore_for_file: avoid_print

import 'package:app_restaurant_management/home/widgets/button_cancel.dart';
import 'package:app_restaurant_management/home/widgets/button_confirm.dart';
import 'package:app_restaurant_management/home/widgets/card_confirm_order.dart';
import 'package:app_restaurant_management/home/widgets/modal_confirm.dart';
import 'package:app_restaurant_management/home/widgets/modal_order_cancel.dart';
import 'package:app_restaurant_management/home/widgets/modal_status.dart';
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
                  onPressed: () async {
                    var res = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const ModalStatus();
                      },
                    );
                    if (res != null) {
                      ///Evaluar
                      print(res);
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(const Duration(seconds: 3), () {
                            Navigator.of(context).pop();
                          });
                          return const ModalOrderCancel(
                              message: 'Orden #001 rechazado',
                              image: 'assets/img/order-cancel.svg');
                        },
                      );
                      Navigator.of(context).pop(true);
                    }
                  },
                ),
                ButtonConfirm(
                  textButton: 'En curso',
                  onPressed: () async {
                    var res = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: ModalConfirm(
                            message: 'Confirmar preparación',
                            image: 'assets/img/confirm-preparation.svg',
                            onPressConfirm: () async {
                              Navigator.of(context).pop('confirmar');
                            },
                            onPressCancel: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    );
                    if (res != null) {
                      ///Evaluar
                      print(res);
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(const Duration(seconds: 3), () {
                            Navigator.of(context).pop();
                          });
                          return const ModalOrderCancel(
                            message: 'Orden #001 en preparación',
                          );
                        },
                      );
                      Navigator.of(context).pop(true);
                    }
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

// ignore_for_file: avoid_print

import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/home/widgets/orders/modal_status.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/home/widgets/orders/card_confirm_order.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class ConfirmOrderScreen extends StatefulWidget {
  final String statusOrder;
  const ConfirmOrderScreen({Key? key, required this.statusOrder})
      : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
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
          "Confirmar Orden",
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
          CardConfirm(statusOrder: widget.statusOrder),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ///Functionality button cancel
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
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                            return const ModalOrder(
                                message: 'Orden #001 rechazado',
                                image: 'assets/img/order-cancel.svg');
                          },
                        );
                      }
                      if (context.mounted) {
                        Navigator.of(context).pop(true);
                      }
                    }
                  },
                ),

                ///Functionality button confirm
                ButtonConfirm(
                  textButton: 'En curso',
                  onPressed: () async {
                    var res = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: ModalConfirm(
                            message: '¿Confirmar preparación?',
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
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                            return const ModalOrder(
                              message: 'Orden #001 en preparación',
                              image: 'assets/img/confirm-inprogress.svg',
                            );
                          },
                        );
                      }
                      if (context.mounted) {
                        Navigator.of(context).pop(true);
                      }
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

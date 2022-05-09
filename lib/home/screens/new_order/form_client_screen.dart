import 'package:app_restaurant_management/home/widgets/new_order/card_form_client.dart';
import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class FormClienScreen extends StatefulWidget {
  const FormClienScreen({Key? key}) : super(key: key);

  @override
  _FormClienScreenState createState() => _FormClienScreenState();
}

class _FormClienScreenState extends State<FormClienScreen> {
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
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
        children: [
          const CardFormClient(),
          const SizedBox(height: 20),
          ButtonConfirm(
            width: MediaQuery.of(context).size.width / 1,
            textButton: 'Confirmar Orden',
            onPressed: () async {
              var res = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    child: ModalConfirm(
                      message: '¿Confirmar Orden?',
                      onPressConfirm: () async {
                        Navigator.of(context).pop('confirmar');
                      },
                      onPressCancel: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  );
                },
              );
              if (res != null) {
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
                        message: 'Ordén registrada exitosamente',
                        image: 'assets/img/order-confirm.svg',
                        secondMessage:
                            'Revisa la orden en la lista de pendientes');
                  },
                );
                Navigator.of(context).pop(true);
              }
            },
          ),
        ],
      ),
    );
  }
}

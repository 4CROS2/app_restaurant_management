import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/stock/widgets/card_form_product_stock.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class NewProductStockScreen extends StatefulWidget {
  const NewProductStockScreen({Key? key}) : super(key: key);

  @override
  State<NewProductStockScreen> createState() => _NewProductStockScreenState();
}

class _NewProductStockScreenState extends State<NewProductStockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Nuevo Producto Comprado",
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
          const CardFormProductStock(),
          const SizedBox(height: 10),
          ButtonConfirm(
            width: MediaQuery.of(context).size.width,
            textButton: 'Agregar',
            onPressed: () async {
              var res = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    child: ModalConfirm(
                      message: '¿Agregar producto al inventario?',
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
                          message:
                              'Se agrego correctamente a la lista del Inventario',
                          image: 'assets/img/confirm-product.svg');
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
    );
  }
}

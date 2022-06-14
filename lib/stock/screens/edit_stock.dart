import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/stock/widgets/card_edit_stock.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class EditProductStockScreen extends StatefulWidget {
  const EditProductStockScreen({Key? key}) : super(key: key);

  @override
  _EditProductStockScreenState createState() => _EditProductStockScreenState();
}

class _EditProductStockScreenState extends State<EditProductStockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Editar Producto",
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
          const CardEditStock(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ///Functionality button cancel
              ButtonCancel(
                textButton: 'Cancelar',
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
              ),

              ///Functionality button confirm
              ButtonConfirm(
                textButton: 'Guardar',
                onPressed: () async {
                  var res = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: ModalConfirm(
                          message:
                              '¿Seguro qué quiere guardar los cambios realizados?',
                          textButtonConfirm: 'Guardar',
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
                          message: 'Cambios guardados exitosamente',
                          image: 'assets/img/confirm-product.svg',
                        );
                      },
                    );
                    Navigator.of(context).pop(true);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

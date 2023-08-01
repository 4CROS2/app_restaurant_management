import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/menu/screens/edit_product.dart';
import 'package:app_restaurant_management/menu/widgets/card_detail_product.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Detalle",
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
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
        children: [
          const CardDetailProduct(),
          Column(
            children: [
              ButtonCancel(
                textButton: "Eliminar",
                icon: Icons.delete_outline_outlined,
                onPressed: () async {
                  var res = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: ModalConfirm(
                          message:
                              '¿Seguro que quieres eliminar este producto del menu?',
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
                            message: 'Se eliminó el producto del Menú',
                            image: 'assets/img/delete-product.svg',
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
              const SizedBox(height: 15),
              ButtonConfirm(
                textButton: "Editar",
                icon: Icons.edit,
                onPressed: () async {
                  await Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const EditProductScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

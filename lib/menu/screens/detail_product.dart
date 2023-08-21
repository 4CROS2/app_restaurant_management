import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/menu/models/product_model.dart';
import 'package:app_restaurant_management/menu/screens/edit_product.dart';
import 'package:app_restaurant_management/menu/widgets/card_detail_product.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class DetailProductScreen extends StatelessWidget {
  final ProductModel product;
  const DetailProductScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Detalle Producto",
          style: textStyleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
        children: [
          CardDetailProduct(product: product),
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
                    await provider.deleteProduct(product.id);
                    await provider.getAllProducts();
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
                      builder: (context) =>
                          EditProductScreen(product: product)));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

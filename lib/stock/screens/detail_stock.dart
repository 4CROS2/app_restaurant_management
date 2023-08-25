import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/stock/bloc/stock_provider.dart';
import 'package:app_restaurant_management/stock/models/stock_model.dart';
import 'package:app_restaurant_management/stock/screens/edit_stock.dart';
import 'package:app_restaurant_management/stock/widgets/card_detail_stock.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class DetailStockScreen extends StatefulWidget {
  final StockModel stock;
  const DetailStockScreen({Key? key, required this.stock}) : super(key: key);

  @override
  State<DetailStockScreen> createState() => _DetailStockScreenState();
}

class _DetailStockScreenState extends State<DetailStockScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StockProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Detalle de Gasto",
          style: textStyleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
        children: [
          CardDetailStock(stock: widget.stock),
          provider.loadingStock
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
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
                                    '¿Seguro que quieres eliminar este producto del inventario?',
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
                          await provider.deleteStock(widget.stock.id);
                          await provider.getAllStocks();
                          if (context.mounted) {
                            await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const ModalOrder(
                                  message:
                                      'Se eliminó el producto del Inventario',
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
                            builder: (context) => EditProductStockScreen(
                                  stock: widget.stock,
                                )));
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

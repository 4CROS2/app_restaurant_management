import 'package:app_restaurant_management/constans.dart';
import 'package:app_restaurant_management/stock/bloc/stock_provider.dart';
import 'package:app_restaurant_management/stock/widgets/card_stock.dart';
import 'package:app_restaurant_management/widgets/empty_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ProductsStockScreen extends StatefulWidget {
  final StockProvider provider;
  final String type;
  const ProductsStockScreen(
      {Key? key, required this.provider, required this.type})
      : super(key: key);

  @override
  State<ProductsStockScreen> createState() => _ProductsStockScreenState();
}

class _ProductsStockScreenState extends State<ProductsStockScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.provider.loadingStock
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: () async {
              await widget.provider.getAllStocks();
            },
            child: widget.provider.listStock.isEmpty
                ? const EmptyContent(texto: 'Ningún gasto registrado')
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: widget.provider.listStock.length,
                    itemBuilder: (context, index) {
                      return widget.type ==
                              widget.provider.listStock[index].type
                          ? Column(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(
                                      DateFormat("EEEEE dd MMMM", "es").format(
                                          widget
                                              .provider.listStock[index].date!),
                                      style: const TextStyle(
                                          fontSize: 16, color: fontGris),
                                    )),
                                CardStock(
                                  stock: widget.provider.listStock[index],
                                ),
                              ],
                            )
                          : widget.type == 'Todo'
                              ? CardStock(
                                  stock: widget.provider.listStock[index],
                                )
                              : Container();
                    },
                  ),
          );
  }
}

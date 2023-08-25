import 'package:app_restaurant_management/stock/bloc/stock_provider.dart';
import 'package:app_restaurant_management/stock/widgets/card_stock.dart';
import 'package:flutter/material.dart';

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
                ? Container()
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: widget.provider.listStock.length,
                    itemBuilder: (context, index) {
                      return widget.type ==
                              widget.provider.listStock[index].type
                          ? CardStock(
                              stock: widget.provider.listStock[index],
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

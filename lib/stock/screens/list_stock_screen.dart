import 'package:app_restaurant_management/constans.dart';
import 'package:app_restaurant_management/stock/bloc/stock_provider.dart';
import 'package:app_restaurant_management/stock/widgets/card_stock.dart';
import 'package:app_restaurant_management/widgets/empty_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductsStockScreen extends StatefulWidget {
  final StockProvider provider;
  const ProductsStockScreen({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  State<ProductsStockScreen> createState() => _ProductsStockScreenState();
}

class _ProductsStockScreenState extends State<ProductsStockScreen> {
  //Fecha
  Container tagDate(int index) {
    DateTime fecha = widget.provider.listStock[index].date!;
    String date = DateFormat("EEEEE dd MMMM", "es").format(fecha);
    String today = DateFormat("EEEEE dd MMMM", "es").format(DateTime.now());
    if (fecha.year < DateTime.now().year) {
      date = DateFormat("EEEEE dd MMMM yyyy", "es").format(fecha);
    }
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(10),
      child: Text(
        date == today ? 'Hoy' : date,
        style: const TextStyle(fontSize: 16, color: fontGris),
      ),
    );
  }

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
                    // reverse: true,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: widget.provider.listStock.length,
                    itemBuilder: (context, index) {
                      var actual = widget.provider.listStock[index];
                      var anterior =
                          widget.provider.listStock[index == 0 ? 0 : index - 1];
                      String actualDate =
                          actual.date.toString().substring(0, 10);
                      String anteriorDate =
                          anterior.date.toString().substring(0, 10);
                      if (actualDate == anteriorDate) {
                        if (index == 0) {
                          return Column(
                            children: [
                              tagDate(index),
                              CardStock(
                                stock: widget.provider.listStock[index],
                              ),
                            ],
                          );
                        }
                        return CardStock(
                          stock: widget.provider.listStock[index],
                        );
                      } else {
                        return Column(
                          children: [
                            tagDate(index),
                            CardStock(
                              stock: widget.provider.listStock[index],
                            ),
                          ],
                        );
                      }
                    },
                  ),
          );
  }
}

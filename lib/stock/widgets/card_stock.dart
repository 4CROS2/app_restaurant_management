import 'package:app_restaurant_management/stock/models/stock_model.dart';
import 'package:app_restaurant_management/stock/screens/detail_stock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardStock extends StatelessWidget {
  final StockModel stock;
  const CardStock({
    Key? key,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                  builder: (context) => DetailStockScreen(
                        stock: stock,
                      )),
            );
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 * 1.2 - 15,
                    child: Text(
                      stock.name,
                      style: textStyleItem,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Text(
                      'Bs. ${(stock.price).toStringAsFixed(1)}',
                      style: const TextStyle(
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.w700,
                          fontSize: fontSizeSubtitle,
                          color: redColor),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

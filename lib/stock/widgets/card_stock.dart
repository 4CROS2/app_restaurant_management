import 'package:app_restaurant_management/stock/screens/detail_stock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardStock extends StatelessWidget {
  final String total;
  final String nameSale;
  const CardStock({
    Key? key,
    required this.total,
    required this.nameSale,
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
                  builder: (context) => const DetailStockScreen()),
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
                      nameSale,
                      style: textStyleTitleSecond,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Text(
                      'Bs. $total',
                      style: const TextStyle(
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.w700,
                          fontSize: fontSizeTitle,
                          color: redColor),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

import 'package:app_restaurant_management/sales/screens/detail_sale_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardSale extends StatelessWidget {
  final String id;
  final String total;
  final String nameSale;
  final String typeSale;
  final String description;
  const CardSale({
    Key? key,
    required this.id,
    required this.total,
    required this.nameSale,
    required this.typeSale,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const DetailSaleScreen(
                      typeSale: 'purchase',
                    )));
          },
          child: Column(
            children: [
              Visibility(
                visible: typeSale == 'ingreso',
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Orden #$id',
                            style: const TextStyle(
                              letterSpacing: 0.75,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: fontSizeRegular,
                              color: greenColor,
                            ),
                          ),
                          Text(
                            '+ Bs. $total',
                            style: const TextStyle(
                              fontFamily: "Work Sans",
                              fontWeight: FontWeight.w700,
                              fontSize: fontSizeTitle,
                              color: greenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    divider,
                    const SizedBox(height: 7),
                    Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        description,
                        style: const TextStyle(
                            letterSpacing: 0.75,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: fontSizeRegular,
                            color: fontGris),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: typeSale == 'egreso',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 * 1.2 - 15,
                      child: Text(
                        nameSale,
                        style: const TextStyle(
                            letterSpacing: 0.75,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: fontSizeRegular,
                            color: redColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        '- Bs. $total',
                        style: const TextStyle(
                            fontFamily: "Work Sans",
                            fontWeight: FontWeight.w700,
                            fontSize: fontSizeTitle,
                            color: redColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

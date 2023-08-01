import 'package:app_restaurant_management/sales/widgets/card_detail_purchase.dart';
import 'package:app_restaurant_management/sales/widgets/card_detail_sale.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class DetailSaleScreen extends StatefulWidget {
  final String typeSale;
  const DetailSaleScreen({Key? key, required this.typeSale}) : super(key: key);

  @override
  State<DetailSaleScreen> createState() => _DetailSaleScreenState();
}

class _DetailSaleScreenState extends State<DetailSaleScreen> {
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
        children: [
          if (widget.typeSale == 'sale')
            const CardDetailSale(statusOrder: 'delivered'),
          if (widget.typeSale == 'purchase') const CardDetailPurchase(),
        ],
      ),
    );
  }
}

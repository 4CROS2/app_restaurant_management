import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardDetailPurchase extends StatefulWidget {
  const CardDetailPurchase({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDetailPurchase> createState() => _CardDetailPurchaseState();
}

class _CardDetailPurchaseState extends State<CardDetailPurchase> {
  /// Title Inventario
  Row titleInventario() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 2 * 0.7,
            child: const Text(
              "Inventario",
              style: TextStyle(color: fontGris, fontSize: fontSizeSmall),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
        const Text(
          'Limpieza',
          style: textStyleLabelRed,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  /// Items Products
  Container itemProduct(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: FadeInImage(
              width: MediaQuery.of(context).size.width / 2 * 0.8,
              height: 150,
              fit: BoxFit.cover,
              placeholder: const AssetImage("assets/img/background.png"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/img/background.png");
              },
              image: const NetworkImage(
                  'https://images.unsplash.com/photo-1649005011845-ef225c89da86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2507&q=80'),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameProduct(),
                total(),
                description(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Name Product
  Container nameProduct() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.9,
      margin: const EdgeInsets.only(bottom: 10),
      child: const Text(
        '10 Detergentes con Shampoo de esika ksoassd',
        style: textStyleSubTitle,
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Total Product
  Container total() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: const Text("Bs. 144", style: textStyleTotalBs),
    );
  }

  /// Text description
  Container description() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.9,
      margin: const EdgeInsets.only(bottom: 10),
      child: const Text(
        'Carne argentina para la parrillada',
        style: textStyleSubItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 25, top: 5, left: 5, right: 5),
      decoration: boxShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleInventario(),
          itemProduct(context),
        ],
      ),
    );
  }
}

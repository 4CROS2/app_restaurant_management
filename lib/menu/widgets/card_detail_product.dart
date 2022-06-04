import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardDetailProduct extends StatefulWidget {
  const CardDetailProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDetailProduct> createState() => _CardDetailProductState();
}

class _CardDetailProductState extends State<CardDetailProduct> {
  /// Type Product
  Container typeProduct() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      margin: const EdgeInsets.only(bottom: 10),
      child: const Text(
        'Platos',
        style: textStyleLabelOrange,
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Status
  Container status() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      margin: const EdgeInsets.only(bottom: 10),
      child: const Text(
        'Disponible',
        style: textStyleLabelGreen,
        textAlign: TextAlign.left,
      ),
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
          image(),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                typeProduct(),
                nameProduct(),
                total(),
                description(),
                status(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container image() {
    return Container(
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
            'https://locosxlaparrilla.com/wp-content/uploads/2015/02/Receta-recetas-locos-x-la-parrilla-locosxlaparrilla-receta-churrascos-parrilla-churrascos-parrilla-receta-churrascos-churrascos-2-1.jpg'),
      ),
    );
  }

  /// Name Product
  Container nameProduct() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      margin: const EdgeInsets.only(bottom: 10),
      child: const Text(
        'Carne (200g)',
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
          itemProduct(context),
        ],
      ),
    );
  }
}

import 'package:app_restaurant_management/menu/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardDetailProduct extends StatefulWidget {
  final ProductModel product;
  const CardDetailProduct({
    Key? key,
    required this.product,
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
      child: Text(
        widget.product.category,
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
      child: Text(
        widget.product.status ? 'Disponible' : 'No disponible',
        style: widget.product.status ? textStyleLabelGreen : textStyleLabelRed,
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
                if (widget.product.description != '') description(),
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
        image: NetworkImage(widget.product.urlPhoto),
      ),
    );
  }

  /// Name Product
  Container nameProduct() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        widget.product.nameProduct,
        style: textStyleSubTitle,
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Total Product
  Container total() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text("Bs. ${widget.product.price}", style: textStyleTotalBs),
    );
  }

  /// Text description
  Container description() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.9,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        widget.product.description,
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

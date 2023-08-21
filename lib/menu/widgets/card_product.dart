// import 'package:flutter/cupertino.dart';
import 'package:app_restaurant_management/menu/models/product_model.dart';
import 'package:app_restaurant_management/menu/screens/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardProduct extends StatelessWidget {
  final ProductModel product;
  const CardProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeW = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => DetailProductScreen(product: product)));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage(
                width: sizeW / 3 - 10,
                height: (sizeW / 4),
                fit: BoxFit.cover,
                placeholder: const AssetImage("assets/img/background.png"),
                image: NetworkImage(
                  product.urlPhoto,
                  // "https://locosxlaparrilla.com/wp-content/uploads/2015/02/Receta-recetas-locos-x-la-parrilla-locosxlaparrilla-receta-churrascos-parrilla-churrascos-parrilla-receta-churrascos-churrascos-2-1.jpg"
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/img/background.png", width: 50);
                },
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 * 1.2 - 4,
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.nameProduct,
                      style: textStyleItem,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     product.description,
                  //     style: const TextStyle(
                  //         letterSpacing: 0.75,
                  //         fontFamily: "Poppins",
                  //         fontWeight: FontWeight.w400,
                  //         fontSize: fontSizeRegular,
                  //         color: fontGris),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),
                  //  Container(
                  //     padding:
                  //         const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [

                  Container(
                    width: MediaQuery.of(context).size.width / 2 * 1.2 - 4,
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.status ? 'Disponible' : 'No disponible',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          letterSpacing: 0.25,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: fontSizeSmall,
                          color: product.status ? greenColor : redColor),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 * 1.2 - 4,
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    alignment: Alignment.topRight,
                    child: Text(
                      'Bs. ${(product.price).toStringAsFixed(1)}',
                      style: textStylePrizeItem,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

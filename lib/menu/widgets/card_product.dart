// import 'package:flutter/cupertino.dart';
import 'package:app_restaurant_management/menu/screens/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardProduct extends StatelessWidget {
  final String price;
  final String itemProduct;
  final String labelState;
  final String description;
  const CardProduct({
    Key? key,
    required this.price,
    required this.itemProduct,
    required this.labelState,
    required this.description,
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
              builder: (context) => const DetailProductScreen()));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage(
                width: sizeW / 3 - 10,
                height: (sizeW / 4),
                fit: BoxFit.scaleDown,
                placeholder: const AssetImage("assets/img/background.png"),
                image: const NetworkImage(
                    "https://locosxlaparrilla.com/wp-content/uploads/2015/02/Receta-recetas-locos-x-la-parrilla-locosxlaparrilla-receta-churrascos-parrilla-churrascos-parrilla-receta-churrascos-churrascos-2-1.jpg"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/img/background.png", width: 50);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 * 1.2 - 4,
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    itemProduct,
                    style: textStyleItem,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    description,
                    style: const TextStyle(
                        letterSpacing: 0.75,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: fontSizeRegular,
                        color: fontGris),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        labelState,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 0.25,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: fontSizeSmall,
                            color: labelState == 'Disponible'
                                ? greenColor
                                : redColor),
                      ),
                      SizedBox(width: sizeW / 6),
                      Text(
                        price,
                        style: textStylePrizeItem,
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

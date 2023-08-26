import 'package:app_restaurant_management/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class SectionCardProduct extends StatefulWidget {
  const SectionCardProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<SectionCardProduct> createState() => _SectionCardProductState();
}

class _SectionCardProductState extends State<SectionCardProduct> {
  bool valorChange = false;

  List<int> listItems = [];

  @override
  Widget build(BuildContext context) {
    final double sizeW = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            child: const Text(
              'Cuadril (200g)',
              style: textStyleItem,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FadeInImage(
              width: sizeW / 3 * 1.6,
              height: (sizeW / 3) - 3,
              fit: BoxFit.scaleDown,
              placeholder: const AssetImage("assets/img/background.png"),
              image: const NetworkImage(
                  "https://locosxlaparrilla.com/wp-content/uploads/2015/02/Receta-recetas-locos-x-la-parrilla-locosxlaparrilla-receta-churrascos-parrilla-churrascos-parrilla-receta-churrascos-churrascos-2-1.jpg"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/img/background.png", width: 50);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 4,
            child: SpinBox(
              min: 0,
              decimals: 0,
              step: 1,
              max: 100,
              value: 0,
              spacing: 0,
              direction: Axis.horizontal,
              textStyle: textStyleSpinBoxNumber,
              incrementIcon:
                  const Icon(Icons.add, size: 25, color: primaryColor),
              decrementIcon:
                  const Icon(Icons.remove, size: 25, color: primaryColor),
              decoration: decorationSpinBox,
            ),
          ),
          const Text('Bs. 25', style: textStylePriceItem),
        ],
      ),
    );
  }
}

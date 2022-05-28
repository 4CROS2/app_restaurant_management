import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardTotal extends StatelessWidget {
  const CardTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          columnTotal(context, 'Ingresos', '2200', greenColor),
          const VerticalDivider(thickness: 2),
          columnTotal(context, 'Egresos', '1000', redColor),
          const VerticalDivider(thickness: 2),
          columnTotal(context, 'Balance', '924', Colors.black),
        ],
      ),
    );
  }

  SizedBox columnTotal(
      BuildContext context, String text, String total, Color color) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 * 0.8,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              letterSpacing: 0.75,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: fontSizeRegular,
              color: color,
            ),
          ),
          Text(
            total,
            style: TextStyle(
              fontFamily: "Work Sans",
              fontWeight: FontWeight.w700,
              fontSize: fontSizeTitle,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

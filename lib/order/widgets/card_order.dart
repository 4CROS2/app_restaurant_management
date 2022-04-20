import 'package:flutter/material.dart';
import '../../constans.dart';

class CardOrder extends StatelessWidget {
  final String id;
  final String price;
  final String name;
  final Color colorState;
  final String labelState;
  final String description;
  const CardOrder(
      {Key? key,
      required this.id,
      required this.price,
      required this.name,
      required this.colorState,
      required this.labelState,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.05),
          //   blurRadius: 8,
          //   offset: const Offset(0, 100), // changes position of shadow
          // ),
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.038),
          //   blurRadius: 4,
          //   offset: const Offset(0, 50.05), // changes position of shadow
          // ),
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.0326),
          //   blurRadius: 2.4,
          //   offset: const Offset(0, 30.15), // changes position of shadow
          // ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.0285),
            blurRadius: 1.5,
            offset: const Offset(0, 19.32), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.025),
            blurRadius: 1.002,
            offset: const Offset(0, 12.52), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.021),
            blurRadius: 0.6,
            offset: const Offset(0, 7.88), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.0174),
            blurRadius: 0.36,
            offset: const Offset(0, 4.53), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.012),
            blurRadius: 0.15,
            offset: const Offset(0, 1.99), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigator.of(context)
          //     .push(CupertinoPageRoute(builder: (context) => OrderDetail()));
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    id,
                    style: const TextStyle(
                        letterSpacing: 0.75,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: fontSizeRegular),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w700,
                        fontSize: fontSizeTitle),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.perm_identity, size: 22, color: fontGris),
                const SizedBox(width: 8),
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      letterSpacing: 0.75,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: fontSizeRegular,
                      color: fontGris),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.schedule, size: 22, color: colorState),
                const SizedBox(width: 5),
                Text(labelState,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        letterSpacing: 0.25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: fontSizeSmall,
                        color: colorState))
              ],
            ),
            const SizedBox(height: 7),
            const Divider(
              color: dividerColor,
              height: 1,
            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

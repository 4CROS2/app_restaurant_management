import 'package:app_restaurant_management/home/screens/list_order/confirm_in_progress_order.dart';
import 'package:app_restaurant_management/home/screens/list_order/confirm_pending_order.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardOrder extends StatelessWidget {
  final String id;
  final String price;
  final String name;
  final Color colorState;
  final String labelState;
  final String description;
  final String statusOrder;
  const CardOrder(
      {Key? key,
      required this.id,
      required this.price,
      required this.name,
      required this.colorState,
      required this.labelState,
      required this.description,
      required this.statusOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: InkWell(
        onTap: () {
          if (statusOrder == 'pending') {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) =>
                    ConfirmOrderScreen(statusOrder: statusOrder)));
          }
          if (statusOrder == 'inprogress') {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) =>
                    ConfirmOrderInProgressScreen(statusOrder: statusOrder)));
          }
          if (statusOrder == 'send') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ModalOrder(
                    message: 'Orden #001 entregada',
                    image: 'assets/img/order-send.svg');
              },
            );
          }
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

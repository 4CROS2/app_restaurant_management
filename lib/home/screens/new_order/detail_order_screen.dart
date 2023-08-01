// ignore_for_file: avoid_print

import 'package:app_restaurant_management/home/screens/new_order/form_client_screen.dart';
import 'package:app_restaurant_management/home/widgets/new_order/card_note.dart';
import 'package:app_restaurant_management/home/widgets/new_order/list_item.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/button_confirm_min.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class DetailOrderScreen extends StatefulWidget {
  const DetailOrderScreen({Key? key}) : super(key: key);

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  bool cupon = false;

  /// Subtitles Item, Cantidad y Total
  Container subtitles(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 2 * 0.8 - 15,
              child: const Text('Item', style: textStyleSubtitle)),
          SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: const Text('Cantidad', style: textStyleSubtitle)),
          SizedBox(
              width: MediaQuery.of(context).size.width / 4 - 15,
              child: const Text('Total',
                  style: textStyleSubtitle, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  /// Descuento y Subtotal
  Container subTotalDetail(String text, String total) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text, style: textStyleSubTotal),
        Text(total, style: textStyleSubTotal),
      ]),
    );
  }

  /// Total Order
  Container total() {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Total", style: textStyleTotal),
            Text("Bs. 144", style: textStyleTotalBs)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Pedir Orden",
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
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
        children: [
          subtitles(context),
          const ListItemsOrder(),
          subTotalDetail('Subtotal', 'Bs. 144'),
          Visibility(
              visible: cupon,
              child: subTotalDetail('Cupón de descuento', '- Bs. 40')),
          const SizedBox(height: 10),
          divider,
          total(),
          ButtonConfirmMin(
            padding: 100,
            textButton: 'Agregar cupon',
            onPressed: () async {},
          ),
          const CardNote(),
          ButtonCancel(
            width: MediaQuery.of(context).size.width / 1,
            textButton: 'Seguir ordenando',
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20),
          ButtonConfirm(
            width: MediaQuery.of(context).size.width / 1,
            textButton: 'Continuar',
            onPressed: () async {
              var res = await Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const FormClienScreen()));
              if (res == true) {
                if (context.mounted) {
                  Navigator.of(context).pop(true);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

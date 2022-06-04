import 'package:app_restaurant_management/menu/widgets/card_detail_product.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Detalle",
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
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
        children: [
          const CardDetailProduct(),
          Column(
            children: [
              ButtonCancel(
                  textButton: "Eliminar",
                  icon: Icons.delete_outline_outlined,
                  onPressed: () {}),
              const SizedBox(height: 15),
              ButtonConfirm(
                textButton: "Editar",
                icon: Icons.edit,
                onPressed: () {
                  // Navigator.of(context).pop('confirmar');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

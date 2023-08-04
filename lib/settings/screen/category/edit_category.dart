import 'package:app_restaurant_management/settings/widgets/category/card_form_category.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({Key? key}) : super(key: key);

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final TextEditingController nameCategory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Editar Categoría",
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
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
        children: [
          CardFormCategory(
            nameCategory: nameCategory,
          ),
          const SizedBox(height: 10),
          ButtonConfirm(
            width: MediaQuery.of(context).size.width,
            textButton: 'Guardar cambios',
            onPressed: () async {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  Future.delayed(
                    const Duration(seconds: 3),
                    () {
                      Navigator.of(context).pop();
                    },
                  );
                  return const ModalOrder(
                      message: 'Cambios guardados correctamente',
                      image: 'assets/img/confirm-product.svg');
                },
              );
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/settings/screen/category/edit_category.dart';
import 'package:app_restaurant_management/settings/widgets/category/card_detail_category.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class DetailCategoryScreen extends StatelessWidget {
  final CategoryModel category;
  const DetailCategoryScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Detalle Categoría",
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
        children: [
          CardDetailCategory(
            category: category,
          ),
          Column(
            children: [
              ButtonCancel(
                textButton: "Eliminar",
                icon: Icons.delete_outline_outlined,
                onPressed: () async {
                  var res = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: ModalConfirm(
                          message:
                              '¿Seguro que quieres eliminar esta categoría?',
                          onPressConfirm: () async {
                            Navigator.of(context).pop('confirmar');
                          },
                          onPressCancel: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  );
                  if (res != null) {
                    if (context.mounted) {
                      await provider.deleteCategory(category.id);
                      await provider.getAllCategories();
                      if (context.mounted) {
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
                              message: 'Se eliminó la categoría',
                              image: 'assets/img/delete-product.svg',
                            );
                          },
                        );
                      }
                    }
                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  }
                },
              ),
              const SizedBox(height: 15),
              ButtonConfirm(
                textButton: "Editar",
                icon: Icons.edit,
                onPressed: () async {
                  await Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const EditCategoryScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

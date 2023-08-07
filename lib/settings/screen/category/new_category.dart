import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constans.dart';

class NewCategoryScreen extends StatefulWidget {
  const NewCategoryScreen({Key? key}) : super(key: key);

  @override
  State<NewCategoryScreen> createState() => _NewCategoryScreenState();
}

SingingCharacter? _character = SingingCharacter.disponible;

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  final TextEditingController nameCategory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Nueva Categoría",
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
          Container(
            alignment: Alignment.topLeft,
            padding:
                const EdgeInsets.only(top: 5, bottom: 15, left: 10, right: 10),
            margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
            decoration: boxShadow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleCardForm('Nombre de la Categoría'),
                TextFormField(controller: nameCategory),
                Container(
                  width: MediaQuery.of(context).size.width / 2 * 0.8,
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleCardForm('Estado'),
                      RadioListTile<SingingCharacter>(
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        title: const Text('Disponible'),
                        value: SingingCharacter.disponible,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        title: const Text('No Disponible'),
                        value: SingingCharacter.nodisponible,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ButtonConfirm(
            width: MediaQuery.of(context).size.width,
            textButton: 'Agregar',
            onPressed: () async {
              var res = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    child: ModalConfirm(
                      message: '¿Agregar categoría al menú?',
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
                await provider.addCategory(nameCategory.text,
                    (_character == SingingCharacter.disponible));
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
                          message:
                              'Se agrego correctamente a la lista del Menú',
                          image: 'assets/img/confirm-product.svg');
                    },
                  );
                }
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

import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

enum SingingCharacter { disponible, nodisponible }

class EditCategoryScreen extends StatefulWidget {
  final CategoryModel category;
  const EditCategoryScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

// Subtitle Forms
Container titleCardForm(String text) {
  return Container(
    alignment: Alignment.topLeft,
    margin: const EdgeInsets.only(right: 5, bottom: 5),
    child: Text(
      text,
      style: textStyleSubtitle,
    ),
  );
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final TextEditingController _nameCategory = TextEditingController();
  SingingCharacter? _character;

  @override
  void initState() {
    super.initState();
    _nameCategory.text = widget.category.name;
    _character = widget.category.status
        ? SingingCharacter.disponible
        : SingingCharacter.nodisponible;
  }

  @override
  void dispose() {
    _nameCategory.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);

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
          Container(
            alignment: Alignment.topLeft,
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
            decoration: boxShadow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(right: 5, bottom: 5),
                  child: const Text(
                    'Nombre de la Categoría',
                    style: textStyleSubtitle,
                  ),
                ),
                TextFormField(controller: _nameCategory),
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
            textButton: 'Guardar cambios',
            onPressed: () async {
              await provider.updateCategory(
                  widget.category.id,
                  _nameCategory.text,
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
                        Navigator.of(context).pop();
                      },
                    );
                    return const ModalOrder(
                        message: 'Cambios guardados correctamente',
                        image: 'assets/img/confirm-product.svg');
                  },
                );
              }
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

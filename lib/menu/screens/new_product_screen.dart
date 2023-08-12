import 'dart:io';

import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  String nameCategory = '';
  var path = '';
  categories(
      List<CategoryModel> lista, String? selected, SettingsProvider provider) {
    var listCategories = <DropdownMenuItem<String>>[];
    listCategories = List<DropdownMenuItem<String>>.generate(
        lista.length,
        (index) => DropdownMenuItem<String>(
              value: lista[index].name,
              child: Text(lista[index].name),
            ));
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      style: textStyleItem,
      hint: const Text(
        "Seleccionar Categoría",
        style: TextStyle(color: Colors.grey),
      ),
      value: selected!.isNotEmpty ? selected : null,
      validator: (String? value) {
        if (value == null) {
          return "Seleccione una categoria";
        }
        return null;
      },
      onChanged: (value) {
        selected = value;
        setState(() {
          nameCategory = value!;
        });
      },
      items: listCategories,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<SettingsProvider>(context, listen: false);
      provider.getAllCategories();
      // }
    });
    super.initState();
  }

  /// Funcionalidad camara
  _imgFromCamera() async {
    try {
      var image = await _picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxWidth: 1280,
          maxHeight: 720);
      if (image != null) {
        setState(() {
          path = 'files/${image.path}';
          _image = File(image.path);
        });
        // currentCutProvider.listImage.add(File(image.path));
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print("Fallo al sacar foto");
      // ignore: avoid_print
      print(e);
    }
  }

  /// Foto del Producto
  Column photoProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleCardForm('Foto del Producto'),
        InkWell(
          onTap: () async {
            await _imgFromCamera();
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 3 * 1.3,
            height: MediaQuery.of(context).size.width / 3 * 1.4,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              border: Border.all(color: secondColor),
            ),
            child: _image != null
                ? Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.add_photo_alternate_rounded, size: 50),
          ),
        ),
      ],
    );
  }

  // Precio
  SizedBox prize() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleCardForm('Precio'),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: price,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Bs.', style: textStyleItem)],
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Estado
  Container status() {
    return Container(
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
    );
  }

  String dropdownValue = 'Platos';
  SingingCharacter? _character = SingingCharacter.disponible;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController nameProduct = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context);
    final category = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Nuevo Producto",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleCardForm('Nombre de producto'),
                TextFormField(controller: nameProduct),
                titleCardForm('Categoría'),
                categories(category.listCategory, nameCategory, category),
                titleCardForm('Descripción'),
                TextFormField(maxLines: 3, controller: description),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    photoProduct(),
                    Column(
                      children: [
                        prize(),
                        status(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // const CardFormProduct(),
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
                      message: '¿Agregar producto al menú?',
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
                await provider.addProduct(
                    nameProduct.text,
                    (_character == SingingCharacter.disponible),
                    nameCategory,
                    description.text,
                    double.parse(price.text),
                    '');
                final ref = FirebaseStorage.instance.ref().child(path);
                print(path);
                ref.putFile(_image!);
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

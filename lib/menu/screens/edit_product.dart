import 'dart:io';
import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/menu/models/product_model.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class EditProductScreen extends StatefulWidget {
  final ProductModel product;
  const EditProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  PlatformFile? pickedFile;
  final TextEditingController nameCategory = TextEditingController();
  String urlDownload = '';
  SingingCharacter? _character = SingingCharacter.disponible;
  final TextEditingController nameProduct = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<SettingsProvider>(context, listen: false);
      provider.getAllCategories();
      nameCategory.text = widget.product.category;
      _character = widget.product.status
          ? SingingCharacter.disponible
          : SingingCharacter.nodisponible;
      nameProduct.text = widget.product.nameProduct;
      description.text = widget.product.description;
      price.text = widget.product.price.toString();
      urlDownload = widget.product.urlPhoto;
    });
    super.initState();
  }

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
          nameCategory.text = value!;
        });
      },
      items: listCategories,
    );
  }

  /// Foto del Producto
  Column photoProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleCardForm('Foto del Producto'),
        InkWell(
          onTap: () {
            selectFile();
            // await _imgFromCamera();
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 3 * 1.3,
            height: MediaQuery.of(context).size.width / 3 * 1.4,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: secondColor),
            ),
            child: pickedFile != null
                ? Image.file(
                    File(pickedFile!.path!),
                    width: double.infinity,
                    // _image!,
                    fit: BoxFit.cover,
                  )
                : urlDownload != ''
                    ? FadeInImage(
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage("assets/img/background.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/img/background.png");
                        },
                        image: NetworkImage(urlDownload))
                    : const Icon(Icons.add_photo_alternate_rounded, size: 50),
          ),
        ),
      ],
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
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
          "Editar Producto",
          style: textStyleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
        children: [
          // const CardEditProduct(),
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
                categories(category.listCategory, nameCategory.text, category),
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
          const SizedBox(height: 10),
          provider.loadingProduct
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonCancel(
                      textButton: 'Cancelar',
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                      },
                    ),
                    ButtonConfirm(
                        textButton: 'Guardar',
                        onPressed: () async {
                          urlDownload = pickedFile != null
                              ? await provider.uploadFile(pickedFile)
                              : urlDownload;
                          await provider.updateProduct(
                              widget.product.id,
                              nameProduct.text,
                              (_character == SingingCharacter.disponible),
                              nameCategory.text,
                              description.text,
                              double.parse(price.text),
                              urlDownload);
                          await provider.getAllProducts();
                          if (context.mounted) {
                            await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const ModalOrder(
                                  message: 'Cambios guardados exitosamente',
                                  image: 'assets/img/confirm-product.svg',
                                );
                              },
                            );
                          }
                          if (context.mounted) {
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                          }
                        }),
                  ],
                ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);
  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  PlatformFile? pickedFile;
  final _nameCategory = TextEditingController();
  String urlDownload = '';
  SingingCharacter? _character = SingingCharacter.disponible;
  final _nameProduct = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  final _formProduct = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<SettingsProvider>(context, listen: false);
      provider.getAllCategories();
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameProduct.dispose();
    _nameCategory.dispose();
    _description.dispose();
    _price.dispose();
    super.dispose();
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
          _nameCategory.text = value!;
        });
      },
      items: listCategories,
    );
  }

  //Seleccionar archivo
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
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
              // borderRadius: BorderRadius.circular(10),
              border: Border.all(color: secondColor),
            ),
            child: pickedFile != null
                ? Image.file(
                    File(pickedFile!.path!),
                    width: double.infinity,
                    // _image!,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.add_photo_alternate_rounded, size: 50),
          ),
        ),
      ],
    );
  }

  // Precio
  SizedBox price() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleCardForm('Precio'),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _price,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Coloque un precio';
                }
                return null;
              },
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: fontBlack,
          elevation: 0,
          backgroundColor: backgroundColor,
          title: const Text(
            "Nuevo Producto",
            style: textStyleAppBar,
            textAlign: TextAlign.left,
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Form(
            key: _formProduct,
            child: ListView(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 15, left: 10, right: 10),
                  margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
                  decoration: boxShadow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleCardForm('Nombre de producto'),
                      TextFormField(
                        controller: _nameProduct,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escriba el nombre de producto';
                          }
                          return null;
                        },
                      ),
                      titleCardForm('Categoría'),
                      categories(
                          category.listCategory, _nameCategory.text, category),
                      titleCardForm('Descripción'),
                      TextFormField(maxLines: 3, controller: _description),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          photoProduct(),
                          Column(
                            children: [
                              price(),
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
                provider.loadingProduct
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ButtonConfirm(
                        width: MediaQuery.of(context).size.width,
                        textButton: 'Agregar',
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (_formProduct.currentState!.validate()) {
                            pickedFile != null
                                ? urlDownload =
                                    await provider.uploadFile(pickedFile)
                                : urlDownload;
                            await provider.addProduct(
                                _nameProduct.text,
                                (_character == SingingCharacter.disponible),
                                _nameCategory.text,
                                _description.text,
                                double.parse(_price.text),
                                urlDownload);
                            await provider.getAllProducts();
                            if (context.mounted) {
                              await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
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
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

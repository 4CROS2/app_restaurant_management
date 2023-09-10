// import 'dart:io';
import 'dart:io';

import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/menu/widgets/card_form_product.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
// import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  final _nameProduct = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  final _status = TextEditingController();
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
    _status.dispose();
    super.dispose();
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
                : const Icon(Icons.add_photo_alternate_rounded, size: 50),
          ),
        ),
      ],
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
                CardFormProduct(
                  nameController: _nameProduct,
                  categoryController: _nameCategory,
                  descriptionController: _description,
                  priceController: _price,
                  statusController: _status,
                  category: category,
                  photo: photoProduct(),
                ),
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
                                _status.text == 'true',
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
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/menu/models/product_model.dart';
import 'package:app_restaurant_management/menu/widgets/card_form_product.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
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
      _nameCategory.text = widget.product.category;
      _status.text = widget.product.status ? 'true' : 'false';
      _nameProduct.text = widget.product.nameProduct;
      _description.text = widget.product.description;
      _price.text = widget.product.price.toString();
      urlDownload = widget.product.urlPhoto;
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
            "Editar Producto",
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
                              FocusScope.of(context).unfocus();
                              if (_formProduct.currentState!.validate()) {
                                pickedFile != null
                                    ? urlDownload =
                                        await provider.uploadFile(pickedFile)
                                    : urlDownload;
                                await provider.updateProduct(
                                    widget.product.id,
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
                                            'Cambios guardados exitosamente',
                                        image: 'assets/img/confirm-product.svg',
                                      );
                                    },
                                  );
                                }
                                if (context.mounted) {
                                  Navigator.of(context).pop(true);
                                  Navigator.of(context).pop(true);
                                }
                              }
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

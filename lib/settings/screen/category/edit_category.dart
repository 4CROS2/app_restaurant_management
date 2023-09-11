import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/settings/widgets/category/card_form_category.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class EditCategoryScreen extends StatefulWidget {
  final CategoryModel category;
  const EditCategoryScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final _nameCategory = TextEditingController();
  final _status = TextEditingController();
  final _formCategory = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameCategory.text = widget.category.name;
      _status.text = widget.category.status ? 'true' : 'false';
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameCategory.dispose();
    _status.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
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
            "Editar Categoría",
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
            key: _formCategory,
            child: ListView(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
              children: [
                CardFormCategory(
                    nameController: _nameCategory, statusController: _status),
                const SizedBox(height: 10),
                provider.loadingCategories
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
                              if (_formCategory.currentState!.validate()) {
                                await provider.updateCategory(
                                    widget.category.id,
                                    _nameCategory.text,
                                    _status.text == 'true');
                                await provider.getAllCategories();
                                if (context.mounted) {
                                  await showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return const ModalOrder(
                                          message:
                                              'Cambios guardados correctamente',
                                          image:
                                              'assets/img/confirm-product.svg');
                                    },
                                  );
                                }
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
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

import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/menu/widgets/card_product.dart';
import 'package:app_restaurant_management/widgets/empty_content.dart';
import 'package:flutter/material.dart';

class ProductsMenuScreen extends StatefulWidget {
  final MenuProvider provider;
  final String category;
  const ProductsMenuScreen(
      {Key? key, required this.provider, required this.category})
      : super(key: key);

  @override
  State<ProductsMenuScreen> createState() => _ProductsMenuScreenState();
}

class _ProductsMenuScreenState extends State<ProductsMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final list = widget.provider.listProduct
        .where((element) => element.category == widget.category)
        .toList();
    return widget.provider.loadingProduct
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: () async {
              await widget.provider.getAllProducts();
            },
            child: list.isEmpty
                ? const EmptyContent(
                    texto: 'Ningún producto agregado a la lista')
                : ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 30),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return CardProduct(product: list[index]);
                    },
                  ),
          );
  }
}

import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/menu/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsMenuScreen extends StatefulWidget {
  final MenuProvider provider;
  const ProductsMenuScreen({Key? key, required this.provider})
      : super(key: key);

  @override
  State<ProductsMenuScreen> createState() => _ProductsMenuScreenState();
}

class _ProductsMenuScreenState extends State<ProductsMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.provider.loadingProduct
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: () async {
              await widget.provider.getAllProducts();
            },
            child: widget.provider.listProduct.isEmpty
                ? Container()
                : ListView.builder(
                    // shrinkWrap: true,
                    // physics: const ScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: widget.provider.listProduct.length,
                    itemBuilder: (context, index) {
                      return CardProduct(
                          product: widget.provider.listProduct[index]);
                    },
                  ),
          );
  }
}

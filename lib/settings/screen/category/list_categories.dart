import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/widgets/category/card_category.dart';
import 'package:flutter/material.dart';

class ListCategoriesScreen extends StatefulWidget {
  final SettingsProvider category;
  const ListCategoriesScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<ListCategoriesScreen> createState() => _ListCategoriesScreenState();
}

class _ListCategoriesScreenState extends State<ListCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: widget.category.listCategory.length,
          itemBuilder: (context, index) {
            return CardCategory(category: widget.category.listCategory[index]);
          },
        ),
      ],
    );
  }
}

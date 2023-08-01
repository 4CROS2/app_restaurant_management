import 'package:app_restaurant_management/settings/widgets/category/card_category.dart';
import 'package:flutter/material.dart';

class ListCategoriesScreen extends StatefulWidget {
  const ListCategoriesScreen({Key? key}) : super(key: key);

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
          itemCount: 4,
          itemBuilder: (context, index) {
            return const CardCategory(
                nameCategory: 'Alimentos', status: 'Activo');
          },
        ),
      ],
    );
  }
}

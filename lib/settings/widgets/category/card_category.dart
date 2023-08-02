import 'package:app_restaurant_management/settings/models/category_model.dart';
import 'package:app_restaurant_management/settings/screen/category/detail_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constans.dart';

class CardCategory extends StatelessWidget {
  final CategoryModel category;
  const CardCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                  builder: (context) =>
                      DetailCategoryScreen(category: category)),
            );
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      category.name,
                      style: textStyleItem,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Text(
                      category.status ? 'Activo' : 'Inactivo',
                      style: TextStyle(
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: fontSizeRegular,
                        color: category.status ? greenColor : redColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

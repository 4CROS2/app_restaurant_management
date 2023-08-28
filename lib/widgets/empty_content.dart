import 'package:app_restaurant_management/constans.dart';
import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final String texto;
  final String img;
  const EmptyContent({
    Key? key,
    required this.texto,
    this.img = "assets/img/img-empty.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height / 3,
        padding: const EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              img,
              height: MediaQuery.of(context).size.height / 2 * 0.6,
            ),
            const SizedBox(height: 20),
            Text(
              texto,
              style: textStyleSubItem,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

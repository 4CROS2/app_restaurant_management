import 'package:app_restaurant_management/home/widgets/button_cancel.dart';
import 'package:app_restaurant_management/home/widgets/button_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constans.dart';

class ModalConfirm extends StatelessWidget {
  const ModalConfirm({
    Key? key,
    required this.message,
    this.image = '',
    this.textButtonConfirm = 'Confirmar',
    this.textButtonCancel = 'Cancelar',
    required this.onPressConfirm,
    required this.onPressCancel,
    this.height = 310,
  }) : super(key: key);

  final String message;
  final String image;
  final String textButtonConfirm;
  final String textButtonCancel;
  final VoidCallback onPressConfirm;
  final VoidCallback onPressCancel;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width / 1 * 0.9,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  letterSpacing: 0.25,
                  fontFamily: "Poppins",
                  fontSize: fontSizeMedium,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Visibility(
              visible: image != '',
              child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: SvgPicture.asset(image,
                      width: MediaQuery.of(context).size.width / 3 * 1.2))),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCancel(
                    width: MediaQuery.of(context).size.width / 4 * 1.3,
                    textButton: textButtonCancel,
                    onPressed: () {
                      onPressCancel();
                    }),
                ButtonConfirm(
                    width: MediaQuery.of(context).size.width / 4 * 1.3,
                    textButton: textButtonConfirm,
                    onPressed: () {
                      onPressConfirm();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

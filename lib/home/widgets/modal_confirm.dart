import 'package:app_restaurant_management/home/widgets/button_cancel.dart';
import 'package:app_restaurant_management/home/widgets/button_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constans.dart';

class ModalConfirm extends StatelessWidget {
  const ModalConfirm({
    Key? key,
    required this.message,
    this.secondMessage,
    this.image = '',
    this.textButtonConfirm = 'Confirmar',
    this.textButtonCancel = 'Cancelar',
    required this.onPressConfirm,
    required this.onPressCancel,
  }) : super(key: key);

  final String message;
  final Widget? secondMessage;
  final String image;
  final String textButtonConfirm;
  final String textButtonCancel;
  final VoidCallback onPressConfirm;
  final VoidCallback onPressCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15, top: 15),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: textStyleMessage,
          ),
        ),
        Visibility(
          visible: secondMessage != null,
          child: Container(child: secondMessage),
        ),
        Visibility(
            visible: image != '',
            child: SvgPicture.asset(image,
                width: MediaQuery.of(context).size.width / 3 * 1.2)),
        Container(
          margin: const EdgeInsets.only(bottom: 20, top: 15),
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
    );
  }
}

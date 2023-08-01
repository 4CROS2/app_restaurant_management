import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:flutter/material.dart';

class ModalConfirmLogout extends StatefulWidget {
  const ModalConfirmLogout({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalConfirmLogout> createState() => _ModalConfirmLogoutState();
}

class _ModalConfirmLogoutState extends State<ModalConfirmLogout> {
  Text title() {
    return const Text("Esta seguro de cerrar sesión",
        textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCancel(textButton: "No", onPressed: () {}),
                ButtonConfirm(textButton: "Si", onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

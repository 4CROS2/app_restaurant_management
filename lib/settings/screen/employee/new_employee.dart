import 'package:app_restaurant_management/settings/widgets/employee/card_new_employee.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class NewEmployeeScreen extends StatefulWidget {
  const NewEmployeeScreen({Key? key}) : super(key: key);

  @override
  _NewEmployeeScreenState createState() => _NewEmployeeScreenState();
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Agregar Empleado",
          style: TextStyle(
            letterSpacing: 0.75,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            fontSize: fontSizeTitle,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
        children: [
          const CardFormNewEmployee(),
          const SizedBox(height: 10),
          ButtonConfirm(
              width: MediaQuery.of(context).size.width,
              textButton: 'Agregar',
              onPressed: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    Future.delayed(
                      const Duration(seconds: 3),
                      () {
                        Navigator.of(context).pop();
                      },
                    );
                    return const ModalOrder(
                        message: 'Empleado agregado correctamente',
                        image: 'assets/img/confirm-product.svg');
                  },
                );
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}

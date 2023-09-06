import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/widgets/employee/card_new_employee.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class NewEmployeeScreen extends StatefulWidget {
  const NewEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<NewEmployeeScreen> createState() => _NewEmployeeScreenState();
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _cellphone = TextEditingController();
  final _rol = TextEditingController();
  final _status = TextEditingController();
  final _formEmployee = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _cellphone.dispose();
    _rol.dispose();
    _status.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Agregar Empleado",
          style: textStyleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Form(
          key: _formEmployee,
          child: ListView(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
            children: [
              CardFormNewEmployee(
                name: _name,
                email: _email,
                password: _password,
                cellphone: _cellphone,
                rol: _rol,
                status: _status,
              ),
              const SizedBox(height: 10),
              provider.loadingEmployees
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ButtonConfirm(
                      width: MediaQuery.of(context).size.width,
                      textButton: 'Agregar',
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_formEmployee.currentState!.validate()) {
                          await provider.addEmployee(
                              _name.text,
                              _email.text,
                              _password.text,
                              _cellphone.text,
                              _rol.text,
                              _status.text == 'true' ? true : false);
                          await provider.getAllEmployees();
                          if (context.mounted) {
                            await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const ModalOrder(
                                    message: 'Empleado agregado correctamente',
                                    image: 'assets/img/confirm-product.svg');
                              },
                            );
                          }
                          if (context.mounted) {
                            Navigator.of(context).pop(true);
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/models/employee_model.dart';
import 'package:app_restaurant_management/settings/screen/employee/edit_employee.dart';
import 'package:app_restaurant_management/settings/widgets/employee/card_detail_employee.dart';
import 'package:app_restaurant_management/widgets/button_cancel.dart';
import 'package:app_restaurant_management/widgets/button_confirm.dart';
import 'package:app_restaurant_management/widgets/modal_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class DetailEmployeeScreen extends StatefulWidget {
  final EmployeeModel employee;
  const DetailEmployeeScreen({Key? key, required this.employee})
      : super(key: key);

  @override
  State<DetailEmployeeScreen> createState() => _DetailEmployeeScreenState();
}

class _DetailEmployeeScreenState extends State<DetailEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: fontBlack,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Detalle Empleado",
          style: textStyleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        children: [
          CardDetailEmployee(employee: widget.employee),
          provider.loadingEmployees
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    ButtonCancel(
                      textButton: "Eliminar",
                      icon: Icons.delete_outline_outlined,
                      onPressed: () async {
                        var res = await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: ModalConfirm(
                                message:
                                    '¿Seguro que quieres eliminar este empleado?',
                                onPressConfirm: () async {
                                  Navigator.of(context).pop('confirmar');
                                },
                                onPressCancel: () {
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                        );
                        if (res != null) {
                          await provider.deleteEmployee(widget.employee.id);
                          await provider.getAllEmployees();
                          if (context.mounted) {
                            await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const ModalOrder(
                                  message: 'Se eliminó el empleado',
                                  image: 'assets/img/delete-product.svg',
                                );
                              },
                            );
                          }
                          if (context.mounted) {
                            Navigator.of(context).pop(true);
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    ButtonConfirm(
                      textButton: "Editar",
                      icon: Icons.edit,
                      onPressed: () async {
                        await Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => const EditEmployeeScreen()));
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

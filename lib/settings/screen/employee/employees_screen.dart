import 'package:app_restaurant_management/settings/screen/employee/list_employments.dart';
import 'package:app_restaurant_management/settings/screen/employee/new_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constans.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  // Float Button Agregar Producto
  Widget floatButton() => Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width / 1,
        height: 40,
        child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            isExtended: true,
            backgroundColor: primaryColor,
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Text(
                  "AGREGAR EMPLEADO",
                  style: textStyleButton,
                  textAlign: TextAlign.center,
                )),
            onPressed: () async {
              await Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const NewEmployeeScreen()));
            }),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: fontBlack,
          elevation: 0,
          backgroundColor: backgroundColor,
          title: const Text(
            'Empleados',
            style: textStyleTitle,
            textAlign: TextAlign.left,
          ),
        ),
        // ignore: prefer_const_constructors
        body: ListEmploymentsScreen(),
        floatingActionButton: floatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

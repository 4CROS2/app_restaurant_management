// import 'package:app_restaurant_management/home/screens/new_order/new_order_screen.dart';
import 'package:app_restaurant_management/settings/screen/business_screen.dart';
import 'package:app_restaurant_management/settings/screen/category/category_screen.dart';
import 'package:app_restaurant_management/settings/screen/employee/employees_screen.dart';
import 'package:app_restaurant_management/settings/widgets/perfil_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Row(
          children: const [
            Icon(Icons.settings, size: 30, color: Colors.black),
            SizedBox(width: 10),
            Text(
              'Ajustes',
              style: textStyleTitle,
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      body: ListView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        children: [
          const PerfilSection(),
          const SizedBox(height: 40),
          function(
              text: 'Administración de negocio',
              icon: Icons.business,
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const BusinessInfoScreen()));
              }),
          const Divider(),
          function(
              text: 'Administracion de empleados',
              icon: Icons.perm_identity,
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const EmployeesScreen()));
              }),
          const Divider(),
          function(
              text: 'Administracion de categorías',
              icon: Icons.dashboard,
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const CategoryScreen()));
              }),
          const Divider(),
          function(
              text: 'Ordenes canceladas',
              icon: Icons.do_disturb,
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const EmployeesScreen()));
              }),
          const Divider(),
          function(
              text: 'Cerrar Sesión',
              icon: Icons.logout,
              arrow: false,
              onPressed: () {}),
        ],
      ),
    );
  }

  // Row functions
  function(
      {required String text,
      required IconData icon,
      bool arrow = true,
      required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(text),
            const Spacer(),
            if (arrow) const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

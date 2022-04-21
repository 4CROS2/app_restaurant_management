import 'package:flutter/material.dart';
import 'constans.dart';
import 'home/screens/list_orders_screen.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = [
    ListOrdersScreen(),
    Text(
      'Index 1: Menú',
      style: optionStyle,
    ),
    Text(
      'Index 2: Ventas',
      style: optionStyle,
    ),
    Text(
      'Index 4: Inventario',
      style: optionStyle,
    ),
    Text(
      'Index 5: Ajustes',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: navbarColor,
        selectedLabelStyle: const TextStyle(
          fontFamily: "Work Sans",
          fontSize: fontSizeSmall,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Work Sans",
          color: secondColor,
          fontSize: fontSizeSmall,
        ),
        items: [
          bottomItem(context, Icons.home, 'Inicio'),
          bottomItem(context, Icons.local_dining, 'Menú'),
          bottomItem(context, Icons.assessment, 'Ventas'),
          bottomItem(context, Icons.assignment, 'Inventario'),
          bottomItem(context, Icons.settings, 'Ajustes'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem bottomItem(
      BuildContext context, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

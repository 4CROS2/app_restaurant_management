import 'package:app_restaurant_management/home/screens/new_order/detail_order_screen.dart';
import 'package:app_restaurant_management/home/screens/new_order/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  _NewOrderScreenState createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  //Tab Bar
  Tab tabBarValue({required String text}) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: focusColor, width: 1),
        ),
        child: Text(text,
            style: const TextStyle(
                fontFamily: "Work Sans",
                fontWeight: FontWeight.w500,
                fontSize: fontSizeSmall)),
      ),
    );
  }

  // Float Button Agregar Orden
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
                  "PEDIR ORDEN Bs. 40",
                  style: textStyleButton,
                  textAlign: TextAlign.center,
                )),
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const DetailOrderScreen()));
            }),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(120.0), // here the desired height
          child: AppBar(
            foregroundColor: fontBlack,
            elevation: 0,
            backgroundColor: backgroundColor,
            title: const Text(
              'Nueva Orden',
              style: textStyleTitle,
              textAlign: TextAlign.left,
            ),
            bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 5),
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: focusColor,
              ),
              tabs: [
                tabBarValue(text: 'Platos'),
                tabBarValue(text: 'Bebidas'),
              ],
            ),
          ),
        ),
        // ignore: prefer_const_constructors
        body: TabBarView(
          children: const [
            ProductsScreen(),
            ProductsScreen(),
          ],
        ),
        floatingActionButton: floatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

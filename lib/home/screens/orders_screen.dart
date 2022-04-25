import 'package:app_restaurant_management/home/screens/list_in_progress_screen.dart';
import 'package:app_restaurant_management/home/screens/list_pending_screen.dart';
import 'package:app_restaurant_management/home/screens/list_send_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constans.dart';

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({Key? key}) : super(key: key);

  @override
  _ListOrdersScreenState createState() => _ListOrdersScreenState();
}

class _ListOrdersScreenState extends State<ListOrdersScreen> {
  // Banner
  banner() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: SvgPicture.asset(
        "assets/img/banner.svg",
      ),
    );
  }

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
                  "NUEVA ORDEN",
                  style: textStyleButton,
                  textAlign: TextAlign.center,
                )),
            onPressed: () {
              // Navigator.of(context).push(CupertinoPageRoute(
              //     builder: (_) => GetPremium(from: 'signup')));
            }),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(120.0), // here the desired height
          child: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,
            title: banner(),
            bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 5),
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: focusColor,
              ),
              tabs: [
                tabBarValue(text: 'Pendientes'),
                tabBarValue(text: 'En curso'),
                tabBarValue(text: 'Entregados'),
              ],
            ),
          ),
        ),
        // ignore: prefer_const_constructors
        body: TabBarView(
          children: const [
            PendingScreen(),
            InProgressScreen(),
            SendScreen(),
          ],
        ),
        floatingActionButton: floatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

import 'package:app_restaurant_management/home/widgets/button_tap_bar.dart';
import 'package:app_restaurant_management/home/widgets/card_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constans.dart';

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({Key? key}) : super(key: key);

  @override
  _ListOrdersScreenState createState() => _ListOrdersScreenState();
}

class _ListOrdersScreenState extends State<ListOrdersScreen> {
  bool pending = true;
  bool send = false;
  bool inprogress = false;

  // Banner
  Container banner() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: SvgPicture.asset("assets/img/banner.svg"),
    );
  }

  //Tab Bar
  Widget tapBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buttonStatusOrder(
            text: "Pendientes",
            status: pending,
            function: () {
              setState(() {
                pending = !pending;
                inprogress = false;
                send = false;
              });
            },
          ),
          buttonStatusOrder(
            text: "En curso",
            status: inprogress,
            function: () {
              setState(() {
                pending = false;
                inprogress = !inprogress;
                send = false;
              });
            },
          ),
          buttonStatusOrder(
            text: "Despachados",
            status: send,
            function: () {
              setState(() {
                pending = false;
                inprogress = false;
                send = !send;
              });
            },
          ),
        ],
      ),
    );
  }

  // Button Tab Bar
  ButtonTabBar buttonStatusOrder(
      {required String text,
      required bool status,
      required void Function() function}) {
    return ButtonTabBar(
        textButton: text,
        colorText: status ? Colors.white : onTapColor,
        color: status ? onTapColor : tapColor,
        width: MediaQuery.of(context).size.width / 3 * 0.9,
        onPressed: function);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          banner(),
          tapBar(),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (pending) {
                    return const CardOrder(
                      id: 'Orden #001',
                      price: 'Bs. 48',
                      name: 'Adela Canedo',
                      labelState: 'Hace 10 min',
                      colorState: redColor,
                      description: '1x Tablita',
                    );
                  }
                  if (inprogress) {
                    return const CardOrder(
                      id: 'Orden #001',
                      price: 'Bs. 48',
                      name: 'Adela Canedo',
                      labelState: 'Hace 10 min',
                      colorState: yellowColor,
                      description: '1x Tablita',
                    );
                  }
                  if (send) {
                    return const CardOrder(
                      id: 'Orden #001',
                      price: 'Bs. 48',
                      name: 'Adela Canedo',
                      labelState: 'Hace 10 min',
                      colorState: greenColor,
                      description: '1x Tablita',
                    );
                  }
                  return const CardOrder(
                    id: 'Orden #001',
                    price: 'Bs. 48',
                    name: 'Adela Canedo',
                    labelState: 'Hace 10 min',
                    colorState: redColor,
                    description: '1x Tablita',
                  );
                }),
          ),
        ],
      ),
    );
  }
}

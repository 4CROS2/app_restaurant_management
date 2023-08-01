import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardDetailEmployee extends StatefulWidget {
  const CardDetailEmployee({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDetailEmployee> createState() => _CardDetailEmployeeState();
}

class _CardDetailEmployeeState extends State<CardDetailEmployee> {
  Container imageEmployee() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2 * 0.6,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: secondColor),
        ),
        child: const Image(
          image: AssetImage('assets/img/cajero.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container nameEmployee() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: const Text(
        'Andrea Cornejo',
        style: textStyleSubTitle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container typeEmployee() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: const Text(
        'Cajero',
        style: textStyleLabelOrange,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container status() {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 5, right: 15),
      child: const Text(
        'Activo',
        style: textStyleLabelGreen,
        textAlign: TextAlign.right,
      ),
    );
  }

  Container email() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: const Text("andreacodesign@gmail.com", style: textStyleSubItem),
    );
  }

  Container cellphone() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.call,
            color: greenColor,
          ),
          Text(
            '73476960',
            style: textStyleSubItem,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 30, top: 5, left: 15, right: 15),
      decoration: boxShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          status(),
          imageEmployee(),
          nameEmployee(),
          typeEmployee(),
          cellphone(),
          email(),
        ],
      ),
    );
  }
}

import 'package:app_restaurant_management/settings/models/employee_model.dart';
import 'package:flutter/material.dart';
import '../../../constans.dart';

class CardDetailEmployee extends StatefulWidget {
  final EmployeeModel employee;
  const CardDetailEmployee({
    Key? key,
    required this.employee,
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
        child: Image(
          image:
              AssetImage('assets/img/${widget.employee.rol.toLowerCase()}.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container nameEmployee() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 10),
      child: Text(
        widget.employee.name,
        style: textStyleSubTitle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container typeEmployee() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        widget.employee.rol,
        style: textStyleLabelOrange,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container status() {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 5, right: 15),
      child: Text(
        widget.employee.status ? 'Activo' : 'Innactivo',
        style: widget.employee.status ? textStyleLabelGreen : textStyleLabelRed,
        textAlign: TextAlign.right,
      ),
    );
  }

  Container email() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(widget.employee.email, style: textStyleSubItem),
    );
  }

  Container cellphone() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.call,
            color: greenColor,
          ),
          Text(
            widget.employee.cellphone,
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
          if (widget.employee.cellphone != "") cellphone(),
          email(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../constans.dart';

class CardFormEditEmployee extends StatefulWidget {
  const CardFormEditEmployee({
    Key? key,
  }) : super(key: key);

  @override
  State<CardFormEditEmployee> createState() => _CardFormEditEmployeeState();
}

class _CardFormEditEmployeeState extends State<CardFormEditEmployee> {
  String dropdownValue = 'Cajero';
  String imageLink = 'assets/img/cajero.png';
  bool valueStatus = false;

  /// Subtitle Forms
  Container titleCardForm(String text) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      child: Text(
        text,
        style: textStyleSubtitle,
      ),
    );
  }

  /// Imagen por defecto empleado
  imgEmployee() {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 3 * 1.3,
        height: MediaQuery.of(context).size.width / 3 * 1.3,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: secondColor),
          ),
          child: Image(
            image: AssetImage(imageLink),
            fit: BoxFit.cover,
          ),
        ));
  }

  /// Nombre del empleado
  Column nameEmployee() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Nombre del Empleado'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Email
  Column email() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Correo electrónico'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Contraseña
  Column password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Contraseña'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Celular
  Column cellphone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Celular'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Estado
  Row status() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Estado'),
        Row(
          children: [
            const Text('Activo'),
            Checkbox(
              value: valueStatus,
              onChanged: (bool? value) {
                setState(() {
                  valueStatus = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  ///Tipo de empleado
  Column employeeType() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleCardForm('Cargo'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            style: textStyleItem,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                imageLink = ('assets/img/' + newValue + '.png').toLowerCase();
              });
            },
            items: <String>['Cajero', 'Cocinero', 'Repartidor', 'Administrador']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imgEmployee(),
        const SizedBox(height: 10),
        Container(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
          margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
          decoration: boxShadow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameEmployee(),
              email(),
              password(),
              cellphone(),
              employeeType(),
              status(),
            ],
          ),
        ),
      ],
    );
  }
}

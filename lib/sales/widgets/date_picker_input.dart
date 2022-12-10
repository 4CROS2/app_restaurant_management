import 'package:app_restaurant_management/constans.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(DateTime?)? changedFunction;
  final Future<DateTime?> Function(BuildContext, DateTime?) showPickerFunction;
  const DatePickerInput({
    Key? key,
    required this.label,
    required this.controller,
    required this.changedFunction,
    required this.showPickerFunction,
  }) : super(key: key);

  @override
  State<DatePickerInput> createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  Future<dynamic> fechaModal(BuildContext context) async {
    return await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: primaryColor,
            surface: primaryColor,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String current = DateFormat('dd-MM-yyyy').format(now);
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      width: MediaQuery.of(context).size.width * 0.5 - 20,
      child: TextFormField(
        onTap: () async {
          await fechaModal(context).then((value) {
            if (value != null) {
              setState(() {
                widget.controller.text = DateFormat('dd-MM-yyyy').format(value);
              });
              //     // getNacionalByDate(context, value.toString());
            }
          });
        },
        style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: fontSizeRegular,
          color: Colors.white,
        ),
        controller: widget.controller,
        readOnly: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          fillColor: Colors.black,
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child:
                const Icon(Icons.calendar_today, size: 20, color: Colors.white),
          ),
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 15, right: 10),
          filled: true,
          isDense: true,
          hintText: current,
          hintStyle: const TextStyle(
              fontFamily: "Poppins",
              fontSize: fontSizeRegular,
              color: Colors.white),
        ),
      ),
    );
  }
}

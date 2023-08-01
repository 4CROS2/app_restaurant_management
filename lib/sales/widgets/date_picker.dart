import 'package:app_restaurant_management/sales/widgets/date_picker_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constans.dart';

class DatePicker extends StatefulWidget implements PreferredSizeWidget {
  const DatePicker({Key? key})
      : preferredSize = const Size.fromHeight(90.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  GlobalKey<FormState> keyForm = GlobalKey();

  TextEditingController dateStart = TextEditingController();

  TextEditingController dateEnd = TextEditingController();

  DateTime limitDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    limitDate = DateTime(1990);
    // resData = <SearchCase>[];
  }

  @override
  void dispose() {
    dateStart.dispose();
    dateEnd.dispose();
    super.dispose();
  }

  Future<dynamic> fechaModal(BuildContext context, DateTime firstDate) {
    return showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: DateTime.now(),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                cardColor: cardColor,
                dialogBackgroundColor: cardColor,
                colorScheme: const ColorScheme.dark(
                  primary: focusColor,
                  surface: cardColor,
                  onPrimary: fontBlack,
                  onSurface: fontBlack,
                ),
              ),
              child: child!,
            ));
  }

  Widget dateInit() {
    // final provider = Provider.of<SalesServicesProvider>(context, listen: false);
    return DatePickerInput(
      label: "Desde",
      controller: dateStart,
      changedFunction: (value) {
        if (value != null) {
          // String valor = value.toString().substring(0, 10);
        }
      },
      showPickerFunction: (context, currentValue) {
        return fechaModal(context, DateTime(2000)).then((value) {
          if (value != null) {
            if (dateEnd.text.isEmpty && dateStart.text.isEmpty) {}
            dateStart.text = DateFormat("yyyy-MM-dd")
                .format(DateTime.parse(value.toString()));
          }
          return null;
        });
      },
    );
  }

  Widget dateFinish() {
    // final provider = Provider.of<SalesServicesProvider>(context, listen: false);
    return DatePickerInput(
      label: "Hasta",
      controller: dateEnd,
      changedFunction: (value) {
        if (value != null) {
          // String valor = value.toString().substring(0, 10);
        }
      },
      showPickerFunction: (context, currentValue) {
        return fechaModal(context, DateTime(2000)).then((value) {
          if (value != null) {
            if (dateEnd.text.isEmpty && dateStart.text.isEmpty) {}
            dateEnd.text = DateFormat("yyyy-MM-dd")
                .format(DateTime.parse(value.toString()));
          }
          return null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [dateInit(), dateFinish()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_restaurant_management/settings/widgets/employee/card_employee.dart';
import 'package:flutter/material.dart';

class ListEmploymentsScreen extends StatefulWidget {
  const ListEmploymentsScreen({Key? key}) : super(key: key);

  @override
  _ListEmploymentsScreenState createState() => _ListEmploymentsScreenState();
}

class _ListEmploymentsScreenState extends State<ListEmploymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const CardEmployee(
                typeEmployment: 'E', nameEmployment: 'Andrea Cornejo');
          },
        ),
      ],
    );
  }
}

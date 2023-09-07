import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/settings/widgets/employee/card_employee.dart';
import 'package:app_restaurant_management/widgets/empty_content.dart';
import 'package:flutter/material.dart';

class ListEmploymentsScreen extends StatefulWidget {
  final SettingsProvider provider;
  const ListEmploymentsScreen({Key? key, required this.provider})
      : super(key: key);

  @override
  State<ListEmploymentsScreen> createState() => _ListEmploymentsScreenState();
}

class _ListEmploymentsScreenState extends State<ListEmploymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.provider.loadingEmployees
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: () async {
              await widget.provider.getAllEmployees();
            },
            child: widget.provider.listEmployees.isEmpty
                ? const EmptyContent(texto: 'No tiene empelados registrados')
                : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: widget.provider.listEmployees.length,
                    itemBuilder: (context, index) {
                      return CardEmployee(
                          employee: widget.provider.listEmployees[index]);
                    },
                  ),
          );
  }
}

import 'package:app_restaurant_management/constans.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilSection extends StatelessWidget {
  final String email;
  const PerfilSection({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    final user = provider.listEmployees
        .where((element) => element.email == email)
        .toList();
    String name = user[0].name;
    String rol = user[0].rol;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
            child: ClipOval(
              child:
                  // signIn.userInfo.photoURL == null?
                  FadeInImage(
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                placeholder: const AssetImage("assets/img/profile.png"),
                image: AssetImage("assets/img/${rol.toLowerCase()}.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            rol.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            email,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

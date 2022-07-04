import 'package:app_restaurant_management/constans.dart';
import 'package:flutter/material.dart';

class PerfilSection extends StatelessWidget {
  const PerfilSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
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
                placeholder: AssetImage("assets/img/profile.png"),
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              ),
              // : FadeInImage(
              //     width: 70,
              //     height: 70,
              //     fit: BoxFit.cover,
              //     placeholder: AssetImage("assets/img/digital-doc.gif"),
              //     image: NetworkImage(signIn.userInfo.photoURL!),
              //   ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'username',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'PROPIETARIO',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'propietario@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

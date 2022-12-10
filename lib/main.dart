// import 'package:app_restaurant_management/home/bloc/sing_in_social_networks.dart';
import 'package:app_restaurant_management/home/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Restaurant Management',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // inputDecorationTheme:const InputDecorationTheme(),
      ),
      home: const Login(),
    );
  }
}

// class ValidateToken extends StatefulWidget {
//   const ValidateToken({Key? key}) : super(key: key);

//   @override
//   State<ValidateToken> createState() => _ValidateTokenState();
// }

// class _ValidateTokenState extends State<ValidateToken> {
//   @override
//   void initState() {
//     _cargarDatos();

//     super.initState();
//   }

//   _cargarDatos() {
//     WidgetsBinding.instance!.addPostFrameCallback(
//       (timeStamp) async {
//         var authProvider =
//             Provider.of<SignInSocialNetworkInProvider>(context, listen: false);
//         // var preferencias = await SharedPreferences.getInstance();
//         authProvider.loadingValidate = true;
//         authProvider.loadingValidate = false;
//         // print("========Termino==============");
//         if (kDebugMode) {
//           print(authProvider.loadingValidate);
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     final authProvider = Provider.of<SignInSocialNetworkInProvider>(context);
//     if (authProvider.loadingValidate) {
//       return const CircularProgressIndicator();
//     } else {
//       if (!authProvider.isAuth) {
//         return const Login();
//       } else {
//         return const Home();
//       }
//     }
//   }
// }

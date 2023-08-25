// import 'package:app_restaurant_management/home/bloc/sing_in_social_networks.dart';
import 'package:app_restaurant_management/home/bloc/sing_in_social_networks.dart';
import 'package:app_restaurant_management/home/screens/sign_in.dart';
import 'package:app_restaurant_management/menu/bloc/menu_provider.dart';
import 'package:app_restaurant_management/settings/bloc/setting_provider.dart';
import 'package:app_restaurant_management/stock/bloc/stock_provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  OutlineInputBorder borderInput({Color color = Colors.black}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => SignInSocialNetworkInProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => StockProvider()),
      ],
      child: MaterialApp(
        title: 'App Restaurant Management',
        theme: ThemeData(
          primarySwatch: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(9),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: borderInput(),
            focusedErrorBorder: borderInput(),
            focusedBorder: borderInput(),
            errorBorder: borderInput(color: Colors.red),
          ),
          dropdownMenuTheme: DropdownMenuThemeData(
              inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(9),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: borderInput(),
            focusedErrorBorder: borderInput(),
            focusedBorder: borderInput(),
            errorBorder: borderInput(color: Colors.red),
          )),
          // radioTheme: const RadioThemeData(
          //   visualDensity: VisualDensity(
          //     horizontal: VisualDensity.minimumDensity,
          //     vertical: VisualDensity.minimumDensity,
          //   ),
          // ),
        ),
        home: const Login(),
      ),
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

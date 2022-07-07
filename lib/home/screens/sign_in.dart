import 'package:app_restaurant_management/constans.dart';
import 'package:app_restaurant_management/home.dart';
import 'package:flutter/cupertino.dart';
// import 'package:app_restaurant_management/home.dart';
// import 'package:app_restaurant_management/home/bloc/sing_in_social_networks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SignInSocialNetworkInProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          // padding: const EdgeInsets.only(, right: 20, bottom: 10),
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                "assets/img/welcome.svg",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  bottom: 20, top: 10, right: 20, left: 20),
              child: const Text(
                "Quieres que tu negocio de comida crezca , utiliza nuestra app para mejorar tu rendimiento y administrar tu negocio de forma sencilla.",
                textAlign: TextAlign.center,
                style: textStyleItem,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height / 2 * 0.7,
              child: SvgPicture.asset(
                "assets/img/portada.svg",
              ),
            ),
            if (loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            buttonSignIn(
              // provider,
              'Ingresar con Google',
            )
          ],
        ),
      ),
    );
  }

  Widget buttonSignIn(
    // SignInSocialNetworkInProvider provider,
    String text,
  ) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () async {
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => const Home()));
          // await provider.googleAuth();
          // if (provider.isAuth) {
          //   Navigator.pushReplacement(
          //       context, CupertinoPageRoute(builder: (context) => const Home()));
          // }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 2 * 1.5,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset('assets/img/google-icon.svg', width: 30),
              Text(text,
                  style: const TextStyle(
                    letterSpacing: 0.25,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: fontSizeMedium,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

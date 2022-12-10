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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SignInSocialNetworkInProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          // padding: const EdgeInsets.only(, right: 20, bottom: 10),
          children: [
            topImage(context),
            message(),
            image(context),
            if (loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            emailForm(),
            passwordForm(),
            buttonSignIn(
              // provider,
              'Ingresar',
            )
          ],
        ),
      ),
    );
  }

  Container emailForm() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(right: 5, bottom: 5),
              child: const Text(
                'Correo Electrónico:',
                style: textStyleSubtitle,
              )),
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }

  Container passwordForm() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(right: 5, bottom: 5),
              child: const Text(
                'Correo Electrónico:',
                style: textStyleSubtitle,
              )),
          TextFormField(
            controller: passController,
            obscureText: !_passwordVisible,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container image(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      height: MediaQuery.of(context).size.height / 2 * 0.7,
      child: SvgPicture.asset(
        "assets/img/portada.svg",
      ),
    );
  }

  Container message() {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
      child: const Text(
        "Mejora tu rendimiento y administra tu negocio de forma sencilla.",
        textAlign: TextAlign.center,
        style: textStyleItem,
      ),
    );
  }

  topImage(BuildContext context) {
    return SvgPicture.asset(
      "assets/img/welcome.svg",
    );
  }

  Widget buttonSignIn(
    // SignInSocialNetworkInProvider provider,
    String text,
  ) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10),
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

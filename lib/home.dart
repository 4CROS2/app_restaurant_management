import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // loading
    //     ? CircularIndicator()
    //     :
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Center(child: Text("loading")),
    );
  }
}

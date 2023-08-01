import 'package:flutter/material.dart';
import '../constans.dart';

class ButtonConfirmMin extends StatefulWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color color;
  final Color colorText;
  final double padding;
  // ignore: use_key_in_widget_constructors
  const ButtonConfirmMin(
      {required this.textButton,
      required this.onPressed,
      this.color = focusColor,
      this.padding = 20,
      this.colorText = Colors.white});

  @override
  State<ButtonConfirmMin> createState() => _ButtonConfirmMinState();
}

class _ButtonConfirmMinState extends State<ButtonConfirmMin>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: widget.padding, left: widget.padding),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(widget.color),
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return primaryColor;
              }
              if (states.contains(MaterialState.hovered)) {
                return primaryColor;
              }
              if (states.contains(MaterialState.pressed)) {
                return primaryColor;
              }
              return primaryColor;
              // Defer to the widget's default.
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: focusColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Container(
            height: 45,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.textButton,
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: widget.colorText,
                  fontWeight: FontWeight.w400,
                  fontSize: fontSizeSmall),
            ),
          )),
    );
  }
}

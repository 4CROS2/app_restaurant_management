import 'package:flutter/material.dart';
import '../../constans.dart';

class ButtonConfirm extends StatefulWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color color;
  final Color colorText;
  final double width;
  // ignore: use_key_in_widget_constructors
  const ButtonConfirm(
      {required this.textButton,
      required this.onPressed,
      this.color = onTapColor,
      this.width = 125,
      this.colorText = Colors.white});
  @override
  _ButtonConfirmState createState() => _ButtonConfirmState();
}

class _ButtonConfirmState extends State<ButtonConfirm>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
              side: const BorderSide(width: 1, color: onTapColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          width: widget.width == 125
              ? MediaQuery.of(context).size.width / 2 * 0.8
              : widget.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(widget.textButton,
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: widget.colorText,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSizeMedium)),
        ));
  }
}

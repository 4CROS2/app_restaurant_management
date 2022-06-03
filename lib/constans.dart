import 'package:flutter/material.dart';

/// Background Color
const backgroundColor = Color(0xFFF8F8F8);
const navbarColor = Color(0xFFFCFCFC);

/// Card Color
const cardColor = Color(0xFFFCFCFC);
const cardColorSearch = Color(0xFFF2F2F2);
const dividerColor = Color(0xFFDADADA);

/// Icons Colors
const primaryColor = Color(0xFFD84555);
const secondColor = Color(0xFF817E7E);
const thirdColor = Color(0xFF455A64);

/// Tags Colors
const Color redColor = Color(0xFFEB5757);
const Color yellowColor = Color(0xFFF2C94C);
const Color greenColor = Color(0xFF219653);
const Color orangeColor = Color(0xFFEB996E);

/// Taps Colors
const Color focusColor = Color(0xFF000000);
const Color unSelectColor = Color(0xFFFFFFFF);

/// Buttons colors
const Color buttonRed = Color(0xFFE50019);
const Color buttonBlack = Color(0xFF000000);

/// Fonts colors
const Color fontRed = Color(0xFFE50019);
const Color fontGris = Color(0xFF8A8A8A);
const Color fontBrown = Color(0xFFAA624F);
const Color fontSearch = Color(0xFFC4C4C4);
const Color fontBlack = Color(0xFF000000);

/// Font sizes
const fontSizeTitle = 20.0;
const fontSizeSubtitle = 18.0;
const fontSizeMedium = 16.0;
const fontSizeRegular = 15.0;
const fontSizeMin = 14.0;
const fontSizeSmall = 13.0;

/// TextStyle
const textStyleTitle = TextStyle(
  letterSpacing: 0.75,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w700,
  fontSize: fontSizeTitle,
  color: fontBlack,
);
const textStyleTitleSecond = TextStyle(
  letterSpacing: 0.75,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w600,
  fontSize: fontSizeSubtitle,
  color: fontBlack,
);
const textStyleSubTitle = TextStyle(
  letterSpacing: 0.25,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w700,
  fontSize: fontSizeSubtitle,
  color: fontBlack,
);
const textStyleSpinBoxNumber = TextStyle(
  letterSpacing: 0.75,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w400,
  fontSize: fontSizeTitle,
  color: fontBlack,
);
const textStylePrizeItem = TextStyle(
  fontFamily: "Work Sans",
  fontWeight: FontWeight.w700,
  fontSize: fontSizeTitle,
  color: primaryColor,
);
const textStyleSubtitle = TextStyle(
  letterSpacing: 0.25,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w500,
  fontSize: fontSizeMin,
  color: fontBlack,
);
const textStyleItem = TextStyle(
  letterSpacing: 0.25,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
  fontSize: fontSizeMedium,
  color: fontBlack,
);
const textStyleSubItem = TextStyle(
  letterSpacing: 0.75,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
  fontSize: fontSizeRegular,
);
const textStylePrize = TextStyle(
  letterSpacing: 0.75,
  fontFamily: 'Poppins',
  fontSize: fontSizeMedium,
  fontWeight: FontWeight.w500,
);
const textStyleLabelRed = TextStyle(
  letterSpacing: 0.25,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w400,
  fontSize: fontSizeSmall,
  color: redColor,
);
const textStyleLabelYellow = TextStyle(
  letterSpacing: 0.25,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w400,
  fontSize: fontSizeSmall,
  color: yellowColor,
);
const textStyleLabelGreen = TextStyle(
  letterSpacing: 0.25,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w400,
  fontSize: fontSizeSmall,
  color: greenColor,
);
const textStyleQuantity = TextStyle(
  letterSpacing: 0.25,
  fontFamily: "Poppins",
  fontWeight: FontWeight.w400,
  fontSize: fontSizeRegular,
);
const textStyleSubTotal = TextStyle(
    letterSpacing: 0.25,
    fontFamily: 'Poppins',
    fontSize: fontSizeMedium,
    fontWeight: FontWeight.w400,
    color: fontGris);
const textStyleTotal = TextStyle(
  letterSpacing: 0.25,
  fontFamily: 'Poppins',
  fontSize: fontSizeSubtitle,
  fontWeight: FontWeight.w600,
  color: fontRed,
);
const textStyleTotalBs = TextStyle(
  letterSpacing: 0.75,
  fontFamily: 'Poppins',
  fontSize: fontSizeTitle,
  fontWeight: FontWeight.w600,
  color: fontRed,
);
const textStyleCancelTotalBs = TextStyle(
  letterSpacing: 0.75,
  fontFamily: 'Poppins',
  fontSize: fontSizeTitle,
  fontWeight: FontWeight.w600,
  color: fontRed,
  decorationColor: Colors.red,
  decorationStyle: TextDecorationStyle.solid,
  decoration: TextDecoration.lineThrough,
);

///Modal Confirm Text Style
const textStyleButton = TextStyle(
  fontFamily: 'Work Sans',
  fontSize: fontSizeMedium,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
const textStyleMessage = TextStyle(
    letterSpacing: 0.25,
    fontFamily: "Poppins",
    fontSize: fontSizeMedium,
    fontWeight: FontWeight.w500);

/// Divider
const divider = Divider(
  color: dividerColor,
  height: 1,
);

/// Box Shadows
Decoration boxShadow = BoxDecoration(
  color: cardColor,
  borderRadius: BorderRadius.circular(16),
  boxShadow: listBoxShadow,
);

/// List Box Shadows
List<BoxShadow> listBoxShadow = [
  // BoxShadow(
  //   color: Colors.grey.withOpacity(0.05),
  //   blurRadius: 8,
  //   offset: const Offset(0, 100), // changes position of shadow
  // ),
  // BoxShadow(
  //   color: Colors.grey.withOpacity(0.038),
  //   blurRadius: 4,
  //   offset: const Offset(0, 50.05), // changes position of shadow
  // ),
  // BoxShadow(
  //   color: Colors.grey.withOpacity(0.0326),
  //   blurRadius: 2.4,
  //   offset: const Offset(0, 30.15), // changes position of shadow
  // ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.0285),
    blurRadius: 1.5,
    offset: const Offset(0, 19.32), // changes position of shadow
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.025),
    blurRadius: 1.002,
    offset: const Offset(0, 12.52), // changes position of shadow
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.021),
    blurRadius: 0.6,
    offset: const Offset(0, 7.88), // changes position of shadow
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.0174),
    blurRadius: 0.36,
    offset: const Offset(0, 4.53), // changes position of shadow
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.012),
    blurRadius: 0.15,
    offset: const Offset(0, 1.99), // changes position of shadow
  ),
];

// SpinBox Style
InputDecoration decorationSpinBox = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor, width: 1),
        borderRadius: BorderRadius.circular(10.0)),
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.all(0));

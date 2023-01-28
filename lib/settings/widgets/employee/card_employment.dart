import 'package:flutter/material.dart';
import '../../../../constans.dart';

class CardEmployee extends StatelessWidget {
  final String typeEmployment;
  final String nameEmployment;
  const CardEmployee({
    Key? key,
    required this.typeEmployment,
    required this.nameEmployment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: boxShadow,
      child: InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //   CupertinoPageRoute(
            //       builder: (context) => const DetailStockScreen()),
            // );
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 * 1.2 - 15,
                    child: Text(
                      nameEmployment,
                      style: textStyleItem,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Text(
                      typeEmployment == 'P' ? 'Propietario' : 'Empleado',
                      style: TextStyle(
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: fontSizeRegular,
                        color: typeEmployment == 'P' ? greenColor : fontBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

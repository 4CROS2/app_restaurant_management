import 'package:app_restaurant_management/stock/bloc/stock_provider.dart';
import 'package:app_restaurant_management/stock/screens/new_stock_screen.dart';
import 'package:app_restaurant_management/stock/screens/list_stock_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final List<String> listTypeStock = [
    'Todo',
    'Alimentos',
    'Limpieza',
    'Alquiler',
    'Servicios Básicos',
    'Gastos administrativos',
    'Publicidad y mercadeo',
    'Transporte',
    'Otros',
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<StockProvider>(context, listen: false);
      provider.getAllStocks();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Tab Bar
  Tab tabBarValue({required String text, double marginRight = 0}) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: marginRight),
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: focusColor, width: 1),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: "Work Sans",
              fontWeight: FontWeight.w500,
              fontSize: fontSizeRegular),
        ),
      ),
    );
  }

  // Float Button Agregar Producto
  Widget floatButton() => Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width / 1,
        height: 40,
        child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            isExtended: true,
            backgroundColor: primaryColor,
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Text(
                  "AGREGAR GASTO",
                  style: textStyleButton,
                  textAlign: TextAlign.center,
                )),
            onPressed: () async {
              await Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const NewProductStockScreen()));
            }),
      );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StockProvider>(context);
    return DefaultTabController(
      length: listTypeStock.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(120.0), // here the desired height
          child: Stack(
            alignment: const Alignment(1, 0.9),
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: backgroundColor,
                title: Row(
                  children: [
                    SvgPicture.asset('assets/img/inventario.svg'),
                    const SizedBox(width: 10),
                    const Text(
                      'Gastos',
                      style: textStyleTitle,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        TabBar(
                          labelPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          isScrollable: true,
                          padding: const EdgeInsets.only(
                              bottom: 5, left: 5, right: 5),
                          unselectedLabelColor: Colors.black,
                          indicatorWeight: 0,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: focusColor,
                          ),
                          tabs: [
                            for (var listType in listTypeStock)
                              tabBarValue(text: listType),
                            // tabBarValue(text: 'Limpieza'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(right: 10),
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: redColor,
              //       boxShadow: listBoxShadow),
              //   child: IconButton(
              //       onPressed: () async {
              //         await Navigator.of(context).push(CupertinoPageRoute(
              //             builder: (context) =>
              //                 const NewCategoryStockScreen()));
              //       },
              //       icon: const Icon(Icons.add, color: Colors.white, size: 30)),
              // )
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        body: provider.loadingStock
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  for (var listType in listTypeStock)
                    ProductsStockScreen(
                      provider: provider,
                      type: listType,
                    ),
                ],
              ),
        floatingActionButton: floatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

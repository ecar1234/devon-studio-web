import 'package:devon_studio_web/pages/components/application_page.dart';
import 'package:devon_studio_web/pages/components/brand_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    Widget? page;
    switch(_selected){
      case 0:
        page = const ApplicationPage();
        break;
      case 1:
        page = const BrandPage();
        break;
    }
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          SafeArea(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(20),
              child: NavigationRail(
                  backgroundColor: Colors.black,
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                        icon: Icon(Icons.devices),
                        label: Text(
                          "Application (1)",
                          style: TextStyle(color: Colors.white, fontSize: _selected == 0 ? 16 : 14, fontWeight: _selected == 0 ? FontWeight.w600 : FontWeight.w400),
                        )),
                    NavigationRailDestination(
                        icon: Icon(Icons.design_services),
                        label: Text(
                          "Brand (0)",
                          style: TextStyle(color: Colors.white, fontSize:  _selected == 1 ? 16 : 14, fontWeight: _selected == 1 ? FontWeight.w600 : FontWeight.w400),
                        ))
                  ],
                  onDestinationSelected: (val) {
                    setState(() {
                      _selected = val;
                    });
                  },
                  selectedIndex: _selected),
            ),
          ),
          Expanded(child: Container(color: Colors.black, child: page))
        ],
      );
    }));
  }
}

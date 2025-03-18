import 'package:devon_studio_web/pages/company_page.dart';
import 'package:devon_studio_web/pages/contact_page.dart';
import 'package:devon_studio_web/pages/main_page.dart';
import 'package:devon_studio_web/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  final Function(String) onNavigate;
  const MyHomePage({super.key, required this.onNavigate});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<bool> _isHover = [false, false, false, false];
  PageController pageController = PageController();
  int currentIndex = 0;

  // List<Widget> pageOption = [const MainPage(), const CompanyPage(), const ProductPage(), const ContactPage()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black87,
      //   flexibleSpace: FlexibleSpaceBar(),
      //   actions: [
      //     SizedBox(
      //       width: 100,
      //       child: TextButton(
      //           onPressed: () {
      //             widget.onNavigate("/");
      //           },
      //           onHover: (isHover) {
      //             setState(() {
      //               _isHover[0] = isHover;
      //             });
      //           },
      //           style: TextButton.styleFrom(padding: EdgeInsets.zero),
      //           child: Text(
      //             "Home",
      //             style: TextStyle(
      //                 color: _isHover[0] || currentIndex == 0 ? Colors.deepPurple[300] : Color(0xff666666),
      //                 fontSize: _isHover[0] ? 15 : 14,
      //                 fontWeight: _isHover[0] || currentIndex == 0 ? FontWeight.w600 : FontWeight.w400),
      //           )),
      //     ),
      //     const Gap(10),
      //     SizedBox(
      //       width: 100,
      //       child: TextButton(
      //           onPressed: () {
      //             widget.onNavigate("/company");
      //           },
      //           onHover: (isHover) {
      //             setState(() {
      //               _isHover[1] = isHover;
      //             });
      //           },
      //           style: TextButton.styleFrom(padding: EdgeInsets.zero),
      //           child: Text(
      //             "Company",
      //             style: TextStyle(
      //                 color: _isHover[1] || currentIndex == 1 ? Colors.deepPurple[300] : Color(0xff666666),
      //                 fontSize: _isHover[1] ? 15 : 14,
      //                 fontWeight: _isHover[1] || currentIndex == 1 ? FontWeight.w600 : FontWeight.w400),
      //           )),
      //     ),
      //     const Gap(10),
      //     SizedBox(
      //       width: 100,
      //       child: TextButton(
      //           onPressed: () {
      //             widget.onNavigate("/product");
      //           },
      //           onHover: (isHover) {
      //             setState(() {
      //               _isHover[2] = isHover;
      //             });
      //           },
      //           style: TextButton.styleFrom(padding: EdgeInsets.zero),
      //           child: Text(
      //             "Product",
      //             style: TextStyle(
      //                 color: _isHover[2] || currentIndex == 2 ? Colors.deepPurple[300] : Color(0xff666666),
      //                 fontSize: _isHover[2] ? 15 : 14,
      //                 fontWeight: _isHover[2] || currentIndex == 2 ? FontWeight.w600 : FontWeight.w400),
      //           )),
      //     ),
      //     const Gap(10),
      //     SizedBox(
      //       width: 100,
      //       child: TextButton(
      //           onPressed: () {
      //             widget.onNavigate("/contact");
      //           },
      //           onHover: (isHover) {
      //             setState(() {
      //               _isHover[3] = isHover;
      //             });
      //           },
      //           style: TextButton.styleFrom(padding: EdgeInsets.zero),
      //           child: Text(
      //             "Contact",
      //             style: TextStyle(
      //                 color: _isHover[3] || currentIndex == 3 ? Colors.deepPurple[300] : Color(0xff666666),
      //                 fontSize: _isHover[3] ? 15 : 14,
      //                 fontWeight: _isHover[3] || currentIndex == 3 ? FontWeight.w600 : FontWeight.w400),
      //           )),
      //     ),
      //   ],
      // ),
      //   body: PageView(controller: pageController, children: [pageOption[currentIndex]]));
        body: SizedBox());
  }
}

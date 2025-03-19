import 'package:devon_studio_web/pages/company_page.dart';
import 'package:devon_studio_web/pages/contact_page.dart';
import 'package:devon_studio_web/pages/home_page.dart';
import 'package:devon_studio_web/pages/main_page.dart';
import 'package:devon_studio_web/pages/product_page.dart';
import 'package:devon_studio_web/route/route_delegator.dart';
import 'package:devon_studio_web/route/router_infomation_parser.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// final GoRouter _router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => MyHomePage(pageIdx: 0),
//     ),
//     GoRoute(
//       path: '/company',
//       builder: (context, state) => MyHomePage(pageIdx: 1),
//     ),
//     GoRoute(
//       path: '/product',
//       builder: (context, state) => MyHomePage(pageIdx: 2),
//     ),
//     GoRoute(
//       path: '/contact',
//       builder: (context, state) => MyHomePage(pageIdx: 3),
//     ),
//   ],
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DevOn Studio',
      // routerConfig: _router,
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
    );
  }
}



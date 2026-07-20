import 'package:devon_studio_web/route/route_delegator.dart';
import 'package:devon_studio_web/route/router_infomation_parser.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DevOn Studio',
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



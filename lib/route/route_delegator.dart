import 'dart:developer';

import 'package:devon_studio_web/pages/components/common_app_bar.dart';
import 'package:devon_studio_web/pages/home_page.dart';
import 'package:devon_studio_web/pages/main_page.dart';
import 'package:flutter/material.dart';

import '../pages/company_page.dart';
import '../pages/contact_page.dart';
import '../pages/product_page.dart';

class MyRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  String _selectedPage = '/';
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  String get currentConfiguration => _selectedPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(onNavigate: _handleNavigation, idx: _currentIndexNotifier,),
      body: Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            key: ValueKey('/'),
            child: MainPage(onNavigate: _handleNavigation),
          ),
          if (_selectedPage == '/company')
            MaterialPage(
              key: ValueKey('/company'),
              child: CompanyPage(),
            ),
          if (_selectedPage == '/product')
            MaterialPage(
              key: ValueKey('/product'),
              child: ProductPage(),
            ),
          if (_selectedPage == '/contact')
            MaterialPage(
              key: ValueKey('/contact'),
              child: ContactPage(),
            ),
        ],
        onDidRemovePage: (page) {

          notifyListeners();
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    _selectedPage = configuration;
    switch (configuration) {
      case '/':
        _currentIndexNotifier.value = 0;
        break;
      case '/company':
        _currentIndexNotifier.value = 1;
        break;
      case '/product':
        _currentIndexNotifier.value = 2;
        break;
      case '/contact':
        _currentIndexNotifier.value = 3;
        break;
      default:
        _currentIndexNotifier.value = 0;
        break;
    }
    notifyListeners();
  }

  void _handleNavigation(String page) {
    _selectedPage = page;
    switch (page) {
      case '/':
        _currentIndexNotifier.value = 0;
        break;
      case '/company':
        _currentIndexNotifier.value = 1;
        break;
      case '/product':
        _currentIndexNotifier.value = 2;
        break;
      case '/contact':
        _currentIndexNotifier.value = 3;
        break;
      default:
        _currentIndexNotifier.value = 0;
        break;
    }

    notifyListeners();
  }
}

import 'package:devon_studio_web/pages/components/common_app_bar.dart';
import 'package:devon_studio_web/pages/main_page.dart';
import 'package:flutter/material.dart';

import '../pages/company_page.dart';
import '../pages/contact_page.dart';
import '../pages/product_page.dart';
import '../pages/support_page.dart';

class MyRouterDelegate extends RouterDelegate<String> with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  String _selectedPage = '/';
  String? _selectedProductTitle;

  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  String get currentConfiguration {
    if (_selectedPage == '/product/support' && _selectedProductTitle != null) {
      return '/product/support/${Uri.encodeComponent(_selectedProductTitle!)}';
    }
    return _selectedPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onNavigate: _handleNavigation,
        idx: _currentIndexNotifier,
      ),
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
              // ProductPage에 SupportPage로 이동하는 콜백 함수를 전달
              child: ProductPage(onNavigateToSupport: _handleNavigateToSupport),
            ),
          // SupportPage는 ProductPage 위에 쌓이는 구조로 만듭니다.
          if (_selectedPage == '/product/support' && _selectedProductTitle != null)
            MaterialPage(
              key: ValueKey(_selectedProductTitle),
              child: SupportPage(title: _selectedProductTitle!),
            ),
          if (_selectedPage == '/contact')
            MaterialPage(
              key: ValueKey('/contact'),
              child: ContactPage(),
            ),
        ],
        onDidRemovePage: (page) {
          // if (_selectedPage == '/product/support') {
          //   _selectedProductTitle = null;
          //   _selectedPage = '/product'; // 이전 페이지인 ProductPage로 상태 변경
          // }

          notifyListeners();
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    final uri = Uri.parse(configuration);
    if (uri.pathSegments.length == 3 && uri.pathSegments[0] == 'product' && uri.pathSegments[1] == 'support') {
      _selectedPage = '/product/support';
      _selectedProductTitle = Uri.decodeComponent(uri.pathSegments[2]);
      _currentIndexNotifier.value = 2;
    } else {
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
    }

    notifyListeners();
  }

  void _handleNavigateToSupport(String title) {
    _selectedPage = '/product/support';
    _selectedProductTitle = title;
    notifyListeners();
  }

  void _handleNavigation(String page) {
    _selectedPage = page;
    _selectedProductTitle = null;
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

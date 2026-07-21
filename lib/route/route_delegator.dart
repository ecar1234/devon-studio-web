
import 'package:devon_studio_web/pages/components/common_app_bar.dart';
import 'package:devon_studio_web/pages/main_page.dart';
import 'package:flutter/material.dart';

import '../pages/company_page.dart';
import '../pages/contact_page.dart';
import '../pages/product_page.dart';
import '../pages/support_page.dart';
import '../pages/terms_page.dart';

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
  Future<void> setNewRoutePath(String configuration) async {
    print('👉 현재 들어온 URL: $configuration');
    final uri = Uri.parse(configuration);

    // 1. '/product/support/상품명' 3단계 동적 경로 처리
    if (uri.pathSegments.length == 3 &&
        uri.pathSegments[0] == 'product' &&
        uri.pathSegments[1] == 'support') {
      _selectedPage = '/product/support';
      _selectedProductTitle = Uri.decodeComponent(uri.pathSegments[2]);
      _currentIndexNotifier.value = 2; // Product 탭 활성화
    }
    // 2. 일반 단일 경로 처리 ('/', '/company', '/product', '/contact' 등)
    else {
      _selectedPage = configuration;
      _selectedProductTitle = null; // 일반 페이지 이동 시 이전에 남아있던 상품 제목 리셋

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

    // 💡 [핵심] 주소창 입력/새로고침으로 바뀐 변수 상태를 감지하여
    // pages: [...] 리스트를 다시 그리도록 프레임워크에 알립니다.
    notifyListeners();
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
          if(_selectedPage == '/terms_of_service')
            MaterialPage(
              key: ValueKey('/terms_of_service'),
              child: TermsPage(),
            ),
          if(_selectedPage == '/privacy_policy')
            MaterialPage(
              key: ValueKey('/privacy_policy'),
              child: TermsPage(),
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

  // @override
  // Future<void> setNewRoutePath(String configuration) async {
  //   final uri = Uri.parse(configuration);
  //   if (uri.pathSegments.length == 3 && uri.pathSegments[0] == 'product' && uri.pathSegments[1] == 'support') {
  //     _selectedPage = '/product/support';
  //     _selectedProductTitle = Uri.decodeComponent(uri.pathSegments[2]);
  //     _currentIndexNotifier.value = 2;
  //   } else {
  //     _selectedPage = configuration;
  //     switch (configuration) {
  //       case '/':
  //         _currentIndexNotifier.value = 0;
  //         break;
  //       case '/company':
  //         _currentIndexNotifier.value = 1;
  //         break;
  //       case '/product':
  //         _currentIndexNotifier.value = 2;
  //         break;
  //       case '/contact':
  //         _currentIndexNotifier.value = 3;
  //         break;
  //       default:
  //         _currentIndexNotifier.value = 0;
  //         break;
  //     }
  //   }
  //
  //   notifyListeners();
  // }

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

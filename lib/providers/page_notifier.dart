// import 'package:flutter/material.dart';

// class PageNotifier with ChangeNotifier {
//   int _currentPage = 0;
//   int get currentPage => _currentPage;

//   final PageController _pageController = PageController(initialPage: 0);
//   PageController get pageController => _pageController;

//   void onPageChange(int pageIndex) {
//     print("Inside Page Change => $pageIndex");
//     _currentPage = pageIndex;
//     _pageController.animateToPage(pageIndex,
//         duration: Duration(milliseconds: 500), curve: Curves.ease);
//     notifyListeners();
//   }
// }

import 'package:amazon_clone/features/admin/screens/analytics_screen.dart';
import 'package:amazon_clone/features/admin/screens/orders_screen.dart';
import 'package:amazon_clone/features/admin/screens/products_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_varriable.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/admin-screen';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
   int _page = 0;

  double bottomBarWidth = 42;

  double bottomBarBorderWidth = 5;
  List<Widget> pages =[
    const  ProductScreen(),
    const  AnalyticsScreen(),
    const  OrdersScreen()

  ];
  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          
       body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(currentIndex:_page,
      selectedItemColor: GlobalVariables.selectedNavBarColor,
      unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      backgroundColor: GlobalVariables.backgroundColor,
      iconSize: 30,
      onTap: updatePage,
      items: [
        //Posts
        BottomNavigationBarItem(icon: Container(
          width: bottomBarWidth,
          decoration: BoxDecoration(border: Border(
            top: BorderSide(color: _page ==0? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor
          ,  width: bottomBarBorderWidth),
          )),
              child: Icon(Icons.home_outlined),
        ),label: ''
         ),
            // Analytics
          BottomNavigationBarItem(icon: Container(
          width: bottomBarWidth,
          decoration: BoxDecoration(border: Border(
            top: BorderSide(color: _page ==1? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor
          ,  width: bottomBarBorderWidth),
          )),
              child: Icon(Icons.analytics_outlined),
        ),label: ''
         ),
         // Cart
        BottomNavigationBarItem(icon: Container(
          width: bottomBarWidth,
          decoration: BoxDecoration(border: Border(
            top: BorderSide(color: _page ==2? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor
          ,  width: bottomBarBorderWidth),
          )),
              child: Icon(Icons.all_inbox_outlined),
        ),label: ''
         ),
      ],
       ),
    
    );
  }
}
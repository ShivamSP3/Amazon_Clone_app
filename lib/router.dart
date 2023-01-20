
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/admin/screens/products_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/order_details/screens/order_detail_screen.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'features/Auth/Screens/auth_screen.dart';
import 'features/account/Widgets/bottom_bar.dart';
import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => AuthScreen());
    case HomeScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => HomeScreen());
    
    case BottomBar.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => BottomBar());
    
    case AddProductScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => AddProductScreen());

       case AdminScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => AdminScreen());

    case SearchScreen.routeName:
    var searchQuery = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => SearchScreen(
        searchQuery: searchQuery,
      ));

    case ProductDetailScreen.routeName:
    var product = routeSettings.arguments as Product;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => ProductDetailScreen(
        product: product,
      ));
    
        case OrderDetailScreen.routeName:
    var order = routeSettings.arguments as Order;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => OrderDetailScreen(
    order:  order,
      ));


     case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => AddressScreen(
        totalAmount : totalAmount
      ));
    
    case CategoryDealsScreen.routeName:
    var category = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => CategoryDealsScreen(
        category: category,
      ));
   default:
   return  MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => Scaffold(
        body: Center(child: Text("Body Does Not Exists"))
      ));
  }
}
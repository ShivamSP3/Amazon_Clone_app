// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:amazon_clone/features/Auth/Screens/auth_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/global_varriable.dart';
import '../../../constants/utils.dart';
import '../../../providers/userprovider.dart';
class AccountServices{
Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  })async{
    final UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
  List<Order> orderList = [];
  try {
     http.Response res = await http.get(Uri.parse('$uri/api/orders/me'),
     headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': userProvider.user.token
      });
      httpErrorHandle(response: res, 
      context: context,
       onSuccess: (){
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
           orderList.add(
            Order.fromJson(jsonEncode(jsonDecode(res.body)[i]))
          );
        }
       });

  } catch (e) {
    showSnackbar(context, e.toString());
  }
  return orderList;
  }

  void logOut(BuildContext context)async{
    try {
      SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(context, AuthScreen.routeName, (route) => false);
    
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

}
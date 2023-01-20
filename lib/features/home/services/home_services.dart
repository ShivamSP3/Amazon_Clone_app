import 'dart:convert';

import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../constants/error_handling.dart';
import '../../../constants/global_varriable.dart';
import '../../../constants/utils.dart';
import '../../../providers/userprovider.dart';
class HomeServices{
  Future<List<Product>> fetchCategoryProducts ({
    required BuildContext context,
    required String category
  })async{
    final UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
  List<Product> productList = [];
  try {
     http.Response res = await http.get(Uri.parse('$uri/api/products?category=$category'),
     headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': userProvider.user.token
      });
      httpErrorHandle(response: res, 
      context: context,
       onSuccess: (){
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
           productList.add(
            Product.fromJson(jsonEncode(jsonDecode(res.body)[i]))
          );
        }
       });

  } catch (e) {
    showSnackbar(context, e.toString());
  }
  return productList;
  }

  Future<Product> fetchDealOfDay ({
    required BuildContext context,
  })async{
    final UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
     Product product = Product(name: '',
      description: '', quantity: 0,
       images: [], category: '', 
       price: 0);
  try {
     http.Response res = await http.get(Uri.parse('$uri/api/get-deal-of-day'),
     headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': userProvider.user.token
      });
      httpErrorHandle(response: res, 
      context: context,
       onSuccess: (){
        product = Product.fromJson(res.body);
       });

  } catch (e) {
    showSnackbar(context, e.toString());
  }
  return product;
  }
}
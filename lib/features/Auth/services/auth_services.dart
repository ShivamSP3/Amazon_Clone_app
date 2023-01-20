import 'dart:convert';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/Auth/Screens/auth_screen.dart';
import 'package:amazon_clone/features/account/Widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/global_varriable.dart';
import '../../home/screens/home_screen.dart';
import '../../../models/user.dart';
import '../../../providers/userprovider.dart';
class AuthService{
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  })async{
    try {
      User user = User(id: '', name: name, email: email,cart: [], 
      token: '', password: password, address: '', type: 'user');

      http.Response res = await http.post(Uri.parse('${uri}/api/signup'),
     // Method 1
      body: user.toJson(),
      headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8"
      }
      );
      httpErrorHandle(response: res,
      context: context, 
      onSuccess: () {
        showSnackbar(context, 'Account created login with the same credentials');
      });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
        final user = Provider.of<UserProvider>(context,listen: false).user;
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
  // get user data
  void getUserData(BuildContext context)async{
    try {
      var userProvider = Provider.of<UserProvider>(context,listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
       String ? token = prefs.getString('x-auth-token');
       if (token== null) {
         prefs.setString('x-auth-token', '');
       }
       var tokenRes = await http.post(Uri.parse('${uri}/tokenIsValid'),
       headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': token!
      },
       );
       var response = jsonDecode(tokenRes.body);
       if (response == true) {
         http.Response userRes = await http.get(Uri.parse('${uri}/')
         ,headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': token
      },
         );
         userProvider.setUser(userRes.body);
       }
    } catch (e) {
       showSnackbar(context, e.toString());
    }
  }
  void signOut(BuildContext context)async{
    final navigator = Navigator.of(context);
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AuthScreen(),)
    , (route) => false);
  }

}
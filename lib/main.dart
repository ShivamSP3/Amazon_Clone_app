// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/Features/Auth/Screens/auth_screen.dart';
import 'package:amazon_clone/constants/global_varriable.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/providers/userprovider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/account/Widgets/bottom_bar.dart';
import 'package:amazon_clone/features/Auth/services/auth_services.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider(),)],
    child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData( context);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
      colorScheme: ColorScheme.light(primary: GlobalVariables.secondaryColor),
      scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,iconTheme: IconThemeData(color: Colors.black)
      )
     ),
     onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
      );  }
}
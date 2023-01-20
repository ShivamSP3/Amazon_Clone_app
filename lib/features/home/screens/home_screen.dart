// ignore_for_file: prefer_const_constructors
import 'package:amazon_clone/features/home/Widgets/address_box.dart';
import 'package:amazon_clone/features/home/Widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/Widgets/deal_of_the_day.dart';
import 'package:amazon_clone/features/home/Widgets/top_categories.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_varriable.dart';
import 'package:amazon_clone/features/Auth/services/auth_services.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  
  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName,
    arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
         preferredSize: Size.fromHeight(60),
         child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(height: 42,margin: EdgeInsets.only(left: 15),
              child: Material(
                borderRadius: BorderRadius.circular(7),
                elevation: 1,
                child: TextFormField(
                  onFieldSubmitted: navigateToSearchScreen,
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: Padding(padding: EdgeInsets.only(left: 6),
                      child: Icon(Icons.search,color: Colors.black,),)
                    ),filled: true,fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(top: 10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide.none),
                    enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Colors.black38,width: 1)),
                    hintText: "Search Amazon.in"
                    ,hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)
                  ),
                ),
              )
              ),
            ),
            Container(color: Colors.transparent,
            height: 42,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.mic,color:Colors.black ,size: 25,),
            )
        
          ],
         ),)
      ),
     
      // ignore: prefer_const_literals_to_create_immutables
      body: SingleChildScrollView(
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          AddressBox(),
          SizedBox(height: 10,),
          TopCategories(),
          SizedBox(height: 10,),
          CarouselImage(),
         DealOfDay()
          
        ],),
      ),);
  }
}
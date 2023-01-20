
import 'package:amazon_clone/constants/global_varriable.dart';
import 'package:amazon_clone/features/Auth/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../Widgets/below_bar.dart';
import '../Widgets/orders.dart';
import '../Widgets/top_buttons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
   void initState() {
    // TODO: implement initState
    super.initState();
    AuthService().getUserData(context);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(50),
         child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(alignment: Alignment.topLeft,
            child: Image.asset('assets/images/amazon_in.png',width: 120,height: 45,color: Colors.black,),
            ),
            Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(children:const [
          Padding(padding: EdgeInsets.only(right: 15)
          ,child: Icon(Icons.notifications_outlined),
          ),
          Icon(Icons.search),
              ],),
            )
          ],
         ),)
      ),
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 20,),
          TopButtons(),
          SizedBox(height: 20,),
          Orders()
        ],
      ),
    );
  }
}
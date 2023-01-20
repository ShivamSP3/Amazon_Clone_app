import 'package:amazon_clone/constants/global_varriable.dart';
import 'package:amazon_clone/features/Auth/services/auth_services.dart';
import 'package:amazon_clone/features/account/Widgets/single_product.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/order_details/screens/order_detail_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/widgets/loader.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final AdminServices adminServices = AdminServices();
  List<Order>? orders;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrders();
  }


 void  fetchOrders()async{
    orders = await  adminServices.fetchAllOrders(context);
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
             IconButton(onPressed: () => AuthService().signOut(context), icon: Icon(Icons.logout_outlined))       
          ],
         ),)
      ),
     
      body: orders == null ? Loader() : GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: orders!.length ,
     padding: EdgeInsets.all(5),
      itemBuilder: (context, index) {
        final orderData = orders![index];
        return GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, OrderDetailScreen.routeName,arguments: orderData);
          }),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 140,child: SingleProduct(image: orderData.products[0].images[0]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(orderData.products[0].name),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),
    );
  }
}
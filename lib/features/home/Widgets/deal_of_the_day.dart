import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/widgets/loader.dart';
import 'package:flutter/material.dart';
class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  final HomeServices homeServices = HomeServices();
     Product ? product ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDealOfDay();
  }
  fetchDealOfDay()async{
     product = await homeServices.fetchDealOfDay(context: context);
     setState(() {
     });
  }
  void navigateToDetailsScreen(){
    Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
  }
  @override
  Widget build(BuildContext context) {
    return  product== null ? Loader():
    product!.name.isEmpty ? SizedBox() : 
     GestureDetector(
      onTap: navigateToDetailsScreen,
       child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 15,top: 15),
            child: Text('Deal Of the day',style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 10,),
           Image.network(product!.images[0]
        ,  height: 250,
          fit: BoxFit.fitHeight),
          Container( padding: EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: Text('\$${product!.price}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 15,top: 5,right: 40),
            child: Text("${product!.description}",style: TextStyle(fontSize: 20)
            ,maxLines: 2,
            overflow: TextOverflow.ellipsis,),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images.map((e) =>
              Image.network(e
              ,fit: BoxFit.fitWidth,width: 100,height: 100,)).toList(),
     ) 
               ,),
          Container(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15).copyWith(left: 15),
           alignment: Alignment.topLeft,
           child: Text("See all deals",style: TextStyle(color: Colors.cyan[800]),),
          )
        ],
         ),
     );
  }
}
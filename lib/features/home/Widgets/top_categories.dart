import 'package:amazon_clone/constants/global_varriable.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  void navigateTOCategoryPage(BuildContext context,String category){
   Navigator.pushNamed(context, CategoryDealsScreen.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemExtent: 80,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:() =>  navigateTOCategoryPage(context,GlobalVariables.categoryImages[index]['title']!),
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(borderRadius: BorderRadius.circular(50),
                child: Image.asset(GlobalVariables.categoryImages[index]['image']!,
                fit: BoxFit.cover,
                height: 50,width: 50,),
                ),
              ),
              Text(GlobalVariables.categoryImages[index]['title']!,
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)
            ],),
          );
      },),
    );
  }
}
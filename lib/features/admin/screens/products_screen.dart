import 'package:amazon_clone/constants/global_varriable.dart';
import 'package:amazon_clone/features/account/Widgets/single_product.dart';
import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/features/Auth/services/auth_services.dart';
import 'package:amazon_clone/widgets/loader.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
final AdminServices adminServices =AdminServices();
List<Product>? products ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProducts();
  }
  fetchAllProducts()async{
    products = await  adminServices.fetchAllProducts(context);
    setState(() {
      
    });
  }
  void deleteProduct(Product product , int index){
    adminServices.deleteProduct(
     context: context,
     product: product,
     onSuccess: (){
      products!.removeAt(index);
      setState(() {
      });
     },
    );
  }
  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
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
             Text("Admin",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)       
          ],
         ),)
      ),
     
      body: products == null ? const Loader() :  GridView.builder(
        itemCount: products!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
       itemBuilder: (context, index) {
         final productData = products![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(height: 120,
              child: SingleProduct(image: productData.images[0])),
              Container(
                width: double.infinity,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                       child: Text(productData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2
                      ,)),
                  ),
                
                  Container(
                    width: 40,height: 40
                    ,
                    child: IconButton(onPressed:() => deleteProduct(productData,index), icon: Icon(Icons.delete_outlined))),


                ],),
              )
            ]),
          );
       },)
      ,floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: navigateToAddProduct,
        tooltip: 'Add a Product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
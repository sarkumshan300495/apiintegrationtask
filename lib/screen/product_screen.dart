import 'package:apitask/api_services.dart';
import 'package:apitask/model/product_model.dart';

import 'package:flutter/material.dart';



class ProductScreen extends StatelessWidget {
  final List<ProductModel> productlist;

 
  ProductScreen({super.key, required this.productlist});

  final ApiService apiService = ApiService('http://154.26.130.251:302');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product Screen'),
        ),
        body: productlist.isEmpty? const Center(
          child: Text('No products available'),
        ):
        
         ListView.builder(
          
        itemCount: productlist.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0.2,
            shadowColor: Colors.purpleAccent,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
            child: ListTile(
               
              title: Text(productlist[index].code),
              subtitle:Text(productlist[index].productname) ,
            
            ),
          );
        },
      ),
      
        // ),
      ),
    );
  }
}

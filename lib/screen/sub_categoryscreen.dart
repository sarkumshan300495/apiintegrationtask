import 'package:apitask/api_services.dart';
import 'package:apitask/model/category_model.dart';
import 'package:apitask/model/product_model.dart';
import 'package:apitask/model/subcategory_model.dart';
import 'package:apitask/screen/product_screen.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  final List<SubCategory> subCategories;

  SubCategoryScreen({super.key, required this.subCategories});

  final ApiService apiService = ApiService('http://154.26.130.251:302');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SubCategory Screen'),
        ),
        body: GridView.builder(
           gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
          itemCount: subCategories.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                onTap: () async {
                  try {
                    List<ProductModel> proctlist =
                        await apiService.getAllProductsWithImage(
                      1,
                      categoryCode: subCategories[index].code,
                      subCategoryCode: subCategories[index].code,
                    );
              
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => ProductScreen(
                                productlist: proctlist,
                              )),
                    );
                  } catch (e) {
                    print('Error fetching products: $e');
                  }
                },
                title: Text(subCategories[index].name),
                subtitle: const Icon(Icons.category),
              ),
            );
          },
        ),
      
      ),
    );
  }
}

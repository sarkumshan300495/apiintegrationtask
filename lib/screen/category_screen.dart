import 'package:apitask/api_services.dart';
import 'package:apitask/model/category_model.dart';
import 'package:apitask/model/subcategory_model.dart';
import 'package:apitask/screen/sub_categoryscreen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final ApiService apiService = ApiService('http://154.26.130.251:302');

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Category App')),
        ),
        body: FutureBuilder<List<Category>>(
          future: apiService.getAllCategories(1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final categories = snapshot.data!;
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.9,
            shadowColor: Colors.purpleAccent,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    child: ListTile(
                      //  shape: RoundedRectangleBorder(
                      //   side: const BorderSide(width: 1),
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      onTap: () async {
                        List<SubCategory> subCategories =
                            await apiService.getSubCategoriesByCategoryCode(
                                1, categories[index].code);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) =>
                                SubCategoryScreen(subCategories: subCategories, ),
                          ),
                        );
                      },
                      title: Text(categories[index].name),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(Icons.category_rounded,color: Colors.deepPurpleAccent,)),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  );
                
                },
              );
            }
          },
        ),
      ),
    );
  }
}

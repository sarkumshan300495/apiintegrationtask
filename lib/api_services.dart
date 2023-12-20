import 'dart:convert';
import 'package:apitask/model/category_model.dart';
import 'package:apitask/model/product_model.dart';
import 'package:apitask/model/subcategory_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Category>> getAllCategories(int organizationId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Category/GetAll?OrganizationId=$organizationId'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['Data'];
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

   Future<List<SubCategory>> getSubCategoriesByCategoryCode(int organizationId, String categoryCode) async {
    final response = await http.get(
      Uri.parse('$baseUrl/SubCategory/GetbyCategoryCode?OrganizationId=$organizationId&CategoryCode=$categoryCode'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['Data'];
      return data.map((json) => SubCategory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load subcategories');
    }
  }

  
//   Future<List<ProductModel>> getAllProductsWithImage(int organizationId, {String categoryCode = "", String subCategoryCode = ""}) async {
//   final response = await http.get(
//     Uri.parse('$baseUrl/Product/GetAllWithImage?OrganizationId=$organizationId&CategoryCode=$categoryCode&SubCategory=$subCategoryCode'),
//   );

//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body)['Result'];
//     return data.map((json) => ProductModel.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load products');
//   }
// }

Future<List<ProductModel>> getAllProductsWithImage(int organizationId, {String categoryCode = "", String subCategoryCode = ""}) async {
  final response = await http.get(
    Uri.parse('$baseUrl/Product/GetAllWithImage?OrganizationId=$organizationId&CategoryCode=$categoryCode&SubCategory=$subCategoryCode'),
  );

  if (response.statusCode == 200) {
    final dynamic responseData = json.decode(response.body);

    if (responseData != null && responseData is Map<String, dynamic>) {
      if (responseData['Code'] == 200 && responseData['Status'] == true) {
        final List<dynamic>? result = responseData['Result'];

        if (result != null) {
          return result.map((json) => ProductModel.fromJson(json)).toList();
        } else {
          
          return [];  
        }
      } else {
       
        throw Exception('API returned an error: ${responseData['Message']}');
      }
    } else {
      throw Exception('Invalid response format: $responseData');
    }
  } else {
    throw Exception('Failed to load products. Status code: ${response.statusCode}');
  }
}



}

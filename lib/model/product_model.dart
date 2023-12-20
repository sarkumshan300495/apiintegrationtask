class ProductModel {
  final int orgId;
  final String code;
  final String productname;
  final int category;
  final int subcategories;
  final int price;
  final String imagename; 

  ProductModel({
    required this.orgId,
    required this.code,
    required this.productname,
    required this.category,
    required this.subcategories,
    required this.price,
    required this.imagename,
  });

 
factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    orgId: json['OrgId'] ?? 0,
    code: json['Code'] ?? '',
    productname: json['ProductName'] ?? '',
    category: json['Category'] ?? 0,
    subcategories: json['SubCategory'] ?? 0,
    price: json['PcsPrice'] ?? 0,
    imagename: json['ProductImageFileName'] ?? '',
  );
}


}

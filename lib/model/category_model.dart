class Category {
  final int orgId;
  final String code;
  final String name;
 

  Category({
    required this.orgId,
    required this.code,
    required this.name,
    
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      orgId: json['OrgId'],
      code: json['Code'],
      name: json['Name'],
     
    );
  }
}

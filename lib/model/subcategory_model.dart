class SubCategory {
  final int orgId;
  final String code;
  final String name;
  

  SubCategory({
    required this.orgId,
    required this.code,
    required this.name,
    
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      orgId: json['OrgId'],
      code: json['Code'],
      name: json['Name'],
     
    );
  }
}
class CategoriesV2Response {
  final String? status;
  final String? message;
  final List<String>? categories;

  CategoriesV2Response({
    required this.status,
    required this.message,
    required this.categories,
  });

  factory CategoriesV2Response.fromJson(Map<String, dynamic> json) =>
      CategoriesV2Response(
        status: json['status'],
        message: json['message'],
        categories: List<String>.from(json['categories']),
      );
}

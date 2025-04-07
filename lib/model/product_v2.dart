class ProductV2 {
  final int? id;
  final String? title;
  final String? image;
  final int? price;
  final String? description;
  final String? brand;
  final String? model;
  final String? color;
  final String? category;
  final int? discount;
  final bool? popular;
  final bool? onSale;

  ProductV2({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
    required this.model,
    required this.color,
    required this.category,
    required this.discount,
    this.popular,
    this.onSale,
  });

  factory ProductV2.fromJson(Map<String, dynamic> json) => ProductV2(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        price: json['price'],
        description: json['description'],
        brand: json['brand'],
        model: json['model'],
        color: json['color'],
        category: json['category'],
        discount: json['discount'],
        popular: json['popular'],
        onSale: json['onSale'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'price': price,
        'description': description,
        'brand': brand,
        'model': model,
        'color': color,
        'category': category,
        'discount': discount,
        if (popular != null) 'popular': popular,
        if (onSale != null) 'onSale': onSale,
      };
}
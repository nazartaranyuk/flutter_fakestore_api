import 'category.dart';

class Product {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  Product({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    slug: json['slug'],
    price: json['price'],
    description: json['description'],
    category: Category.fromJson(json),
    images: List<String>.from(json['images'])
  );

  @override
  String toString() {
    return 'Product(id: $id, title: $title, slug: $slug, price: $price, description: $description, category: $category, images: $images)';
  }

  Product copyWith({
    int? id,
    String? title,
    String? slug,
    int? price,
    String? description,
    Category? category,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      images: images ?? this.images,
    );
  }
}

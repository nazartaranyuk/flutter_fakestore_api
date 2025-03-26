class Category {
  int? id;
  String? name;
  String? image;
  String? slug;

  Category({this.id, this.name, this.image, this.slug});

  @override
  String toString() {
    return 'Category(id: $id, name: $name, image: $image, slug: $slug)';
  }

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    slug: json['slug']
  );

  Category copyWith({int? id, String? name, String? image, String? slug}) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      slug: slug ?? this.slug,
    );
  }
}

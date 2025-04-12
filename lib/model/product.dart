import 'package:fakestore_api/feature/main_screen/presentation/widgets/add_to_bucket_button_state.dart';

class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  AddToBucketInnerState? buttonState = BucketInitial();

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.buttonState
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    price: json['price'].toDouble(),
    description: json['description'],
    category: json['category'],
    image: json['image'],
  );

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, category: $category, images: $image)';
  }

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    AddToBucketInnerState? state,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      buttonState: state ?? buttonState,
    );
  }
}

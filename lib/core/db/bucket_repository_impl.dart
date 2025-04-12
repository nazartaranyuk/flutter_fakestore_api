import 'package:fakestore_api/core/db/bucket_repository.dart';
import 'package:fakestore_api/core/db/database.dart';
import 'package:fakestore_api/model/product.dart';

class BucketRepositoryImpl implements BucketRepository {
  final MainDatabase database;

  BucketRepositoryImpl({
    required this.database
  });

  @override
  Future<List<Product>> getAllProducts() {
    return database.getProducts();
  }

  @override
  Future<void> saveProduct(Product product) {
    return database.saveProduct(product);
  }
}
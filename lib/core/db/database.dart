import 'package:fakestore_api/model/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MainDatabase {
  late Database db;

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "products_db.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE products (
          id INTEGER PRIMARY KEY,
          title TEXT,
          price REAL,
          description TEXT,
          category TEXT,
          image TEXT
        )
      ''');
      },
    );
  }

  Future<void> saveProduct(Product product) async {
    await db.insert('products', {
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'category': product.category,
      'image': product.image,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> getProducts() async {
    final maps = await db.query('products');
    return maps.map((map) => Product.fromJson(map)).toList();
  }
}

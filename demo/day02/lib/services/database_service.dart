import 'package:day02/models/product_fav.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'product_database.db');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE products_fav(productId INTEGER PRIMARY KEY, isFav INTEGER, userId INTEGER)",
      );
    });
  }

  Future<void> insertProduct(ProductFavotite product) async {
    final db = await database;
    await db.insert('products', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ProductFavotite>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products_fav');
    return List.generate(maps.length, (i) => ProductFavotite.fromMap(maps[i]));
  }
}

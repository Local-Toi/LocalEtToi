import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class database {

  void init() async {

    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
        join(await getDatabasesPath(), 'localettoi.db'),
    );

    onCreate: (db, version) {
      return db.execute('CREATE TABLE users(id INTEGER PRIMARY KEY, firstName TEXT NOT NULL, lastName TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL, birthdate TEXT NOT NULL, created TEXT NOT NULL, newsletter NUMERIC NOT NULL, isProducer NUMERIC NOT NULL, image TEXT)',
                        'CREATE TABLE favorites_shops(id INTEGER PRIMARY KEY, userId INTEGER NOT NULL, FOREIGN KEY(userId) REFERENCES users(id), shopId INTEGER NOT NULL, FOREIGN KEY(shopId) REFERENCES shops(id))',
                        'CREATE TABLE favorites_products(id INTEGER PRIMARY KEY, userId INTEGER NOT NULL, FOREIGN KEY(userId) REFERENCES users(id), productId INTEGER NOT NULL, FOREIGN KEY(productId) REFERENCES products(id))',
                        'CREATE TABLE ratings(id INTEGER PRIMARY KEY, userId INTEGER NOT NULL, FOREIGN KEY(userId) REFERENCES users(id), productId INTEGER NOT NULL, FOREIGN KEY(productId) REFERENCES products(id), shopId INTEGER NOT NULL, FOREIGN KEY(shopId) REFERENCES shops(id), description TEXT NOT NULL, rating NUMERIC NOT NULL )',
                        'CREATE TABLE shops(id INTEGER PRIMARY KEY, producerId INTEGER NOT NULL, FOREIGN KEY(producerId) REFERENCES users(id), name TEXT NOT NULL, description TEXT NOT NULL, latitude NUMERIC NOT NULL, longitude NUMERIC NOT NULL, address TEXT NOT NULL, city TEXT NOT NULL, postcode INT NOT NULL)',
                        'CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT NOT NULL, id_category INTEGER NOT NULL, description TEXT NOT NULL, price NUMERIC NOT NULL, isAvailable NUMERIC NOT NULL, shopId INTEGER NOT NULL, FOREIGN KEY(shopId) REFERENCES shops(id), image TEXT NOT NULL)',);
    },
    version: 1,
    );

  }

  Future<void> insertUser(User user) async {
    final db = await database;

    await db.insert(
      'users',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  Future<List<User>> getUsers() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'] as int,
        firstName: maps[i]['firstName'] as String,
        lastName: maps[i]['lastName'] as String,
        email: maps[i]['email'] as String,
        password: maps[i]['password'] as String,
        birthdate: maps[i]['birthdate'] as DateTime,
        created: maps[i]['created'] as DateTime,
        newsletter: maps[i]['newsletter'] as bool,
        isProducer: maps[i]['isProducer'] as bool,
        image: maps[i]['image'] as String,
      );
    });
  }

  Future<void> updateUser(User user) async {
    final db = await database;

    await db.update(
      'users',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    final db = await database;

    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

    Future<void> insertProduct(Product product) async {
    final db = await database;

    await db.insert(
      'products',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
}

    Future<List<Product>> getProducts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        id_category: maps[i]['id_category'] as int,
        description: maps[i]['description'] as String,
        price: maps[i]['price'] as double,
        isAvailable: maps[i]['isAvailable'] as bool,
        shopId: maps[i]['shopId'] as int,
        image: maps[i]['image'] as String,
      );
    });
    }

    Future<void> updateProduct(Product product) async {
    final db = await database;

    await db.update(
      'products',
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
    }

    Future<void> deleteProduct(int id) async {
    final db = await database;

    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
    }

    Future<void> insertShop(Shop shop) async {
    final db = await database;

    await db.insert(
      'shops',
      shop.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }

    Future<List<Shop>> getShops() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('shops');

    return List.generate(maps.length, (i) {
      return Shop(
        id: maps[i]['id'] as int,
        producerId: maps[i]['producerId'] as int,
        name: maps[i]['name'] as String,
        description: maps[i]['description'] as String,
        latitude: maps[i]['latitude'] as double,
        longitude: maps[i]['longitude'] as double,
        address: maps[i]['address'] as String,
        city: maps[i]['city'] as String,
        postcode: maps[i]['postcode'] as int,
      );
    });
    }

    Future<void> updateShop(Shop shop) async {
    final db = await database;

    await db.update(
      'shops',
      shop.toJson(),
      where: 'id = ?',
      whereArgs: [shop.id],
    );
    }

    Future<void> deleteShop(int id) async {
    final db = await database;

    await db.delete(
      'shops',
      where: 'id = ?',
      whereArgs: [id],
    );
    }

    Future<void> insertRating(Rating rating) async {
    final db = await database;

    await db.insert(
      'ratings',
      rating.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }

    Future<List<Rating>> getRatings() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('ratings');

    return List.generate(maps.length, (i) {
      return Rating(
        id: maps[i]['id'] as int,
        customerId: maps[i]['customerId'] as int,
        productId: maps[i]['productId'] as int,
        shopId: maps[i]['shopId'] as int,
        description: maps[i]['description'] as String,
        rating: maps[i]['rating'] as double,
      );
    });
    }

    Future<void> updateRating(Rating rating) async {
    final db = await database;

    await db.update(
      'ratings',
      rating.toJson(),
      where: 'id = ?',
      whereArgs: [rating.id],
    );
    }

    Future<void> deleteRating(int id) async {
    final db = await database;

    await db.delete(
      'ratings',
      where: 'id = ?',
      whereArgs: [id],

  }

    Future<void> insertFavoriteShop(Favorite_shop favorite_shop) async {
    final db = await database;

    await db.insert(
      'favorites_shops',
      favorite_shop.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }

    Future<List<Favorite_shop>> getFavorites_shops() async {
      final db = await database;

      final List<Map<String, dynamic>> maps = await db.query('favorites_shops');

      return List.generate(maps.length, (i) {
        return Favorite_shop(
          id: maps[i]['id'] as int,
          customerId: maps[i]['customerId'] as int,
          shopId: maps[i]['shopId'] as int,
        );
      });
    }

    Future<void> updateFavoriteShop(Favorite_shop favorite_shop) async {
      final db = await database;

      await db.update(
        'favorites_shops',
        favorite_shop.toJson(),
        where: 'id = ?',
        whereArgs: [favorite_shop.id],
      );
    }

    Future<void> deleteFavoriteShop(int id) async {
      final db = await database;

      await db.delete(
        'favorites_shops',
        where: 'id = ?',
        whereArgs: [id],
      );
    }

    Future<void> insertFavoriteProduct(Favorite_Product favorite_Product) async {
      final db = await database;

      await db.insert(
        'favorites_products',
        favorite_Product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    Future<List<Favorite_Product>> getFavorites_Products() async {
      final db = await database;

      final List<Map<String, dynamic>> maps = await db.query('favorites_products');

      return List.generate(maps.length, (i) {
        return Favorite_Product(
          id: maps[i]['id'] as int,
          customerId: maps[i]['customerId'] as int,
          productId: maps[i]['productId'] as int,
        );
      });
    }

    Future<void> updateFavoriteProduct(Favorite_Product favorite_Product) async {
      final db = await database;

      await db.update(
        'favorites_products',
        favorite_Product.toJson(),
        where: 'id = ?',
        whereArgs: [favorite_Product.id],
      );
    }

    Future<void> deleteFavoriteProduct(int id) async {
      final db = await database;

      await db.delete(
        'favorites_products',
        where: 'id = ?',
        whereArgs: [id],
      );
    }
}


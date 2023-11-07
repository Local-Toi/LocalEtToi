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
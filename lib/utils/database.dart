import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class database {

  void init() async {

    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
        join(await getDatabasesPath(), 'users.db'),
    );

    onCreate: (db, version) {
      return db.execute('CREATE TABLE users(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, email TEXT, password TEXT, birthdate TEXT, created TEXT, newsletter NUMERIC, isProducer NUMERIC, image TEXT)',);
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
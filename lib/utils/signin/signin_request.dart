import 'dart:async';
import 'package:local_et_toi/utils/database.dart';
import '../../model/user.dart';

class LoginRequest {
  DatabaseHelper res = DatabaseHelper();

  Future<User?> getLogin(String username, String password) {
    var result = res.getUserByEmailAndPassword(username,password);
    return result;
  }
}
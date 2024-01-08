import 'package:firebase_auth/firebase_auth.dart';
import '../favorite_repository.dart';

abstract class FavoriteRepository {
  Future<void> addFavorite(String id);
  Future<void> removeFavorite(String id);
  Future<List<String>> getFavorites();
  Future<bool> isFavorite(String id);
  Future<MyFavoriteShop> getFavoriteShop(String shopId);
}

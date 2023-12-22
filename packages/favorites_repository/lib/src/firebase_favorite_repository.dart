import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../favorite_repository.dart';

class FirebaseFavoriteRepository implements FavoriteRepository {
  FirebaseFavoriteRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> addFavorite(String id) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        // pass
      } else {
        throw Exception('User not found or not logged in');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getFavorites() {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        /// /users/{userId}/favorites
        return usersCollection.doc(user.uid).collection('favorites').get().then((snapshot) {
          return snapshot.docs.map((doc) => doc.id).toList();
        });
      } else {
        throw Exception('User not found or not logged in');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isFavorite(String id) {
    // TODO: implement isFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavorite(String id) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }
}

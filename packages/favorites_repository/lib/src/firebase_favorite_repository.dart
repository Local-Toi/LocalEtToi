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
          //print(snapshot.docs.map((doc) => doc.data()).toList());
          return snapshot.docs.map((doc) => doc.id).toList();
        });
      } else {
        throw Exception('User not found or not logged in');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getDocumentData(DocumentReference<Map<String, dynamic>> docRef) async {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot = await docRef.get();
    print(docRef);
    return docSnapshot.data() as Map<String, dynamic>;
  }

  Future<List<Map<String, dynamic>>> getFavoritesData() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('Vous devez être connecté pour accéder à vos favoris');
    }
    CollectionReference<Map<String, dynamic>> favoritesCollection =
        FirebaseFirestore.instance.collection('users').doc(user.uid).collection('favorites');

    // debug
    print(favoritesCollection);

    QuerySnapshot<Map<String, dynamic>> favoritesSnapshot = await favoritesCollection.get();

    print(favoritesSnapshot);
    List<Map<String, dynamic>> favoritesData = [];

    for (var doc in favoritesSnapshot.docs) {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot = await doc.reference.get();
      favoritesData.add(docSnapshot.data() as Map<String, dynamic>);
    }

    return favoritesData;
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

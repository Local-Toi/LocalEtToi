import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../shop_repository.dart';

class FirebaseShopRepository implements ShopRepository {
  FirebaseShopRepository({
    FirebaseAuth? firebaseAuth,
  });

  final shopsCollection = FirebaseFirestore.instance.collection('shops');

  @override
  Future<MyShop> getShop(String shopId) async {
    try {
      return shopsCollection.doc(shopId).get().then(
            (value) =>
            MyShop.fromEntity(
              MyShopEntity.fromDocument(value.data()!),
            ),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setShopData(String shopId, shopData) {
    try {
      return shopsCollection.doc(shopId).set(shopData);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MyShop>> getAllShops() async {
    try {
      final QuerySnapshot<
          Map<String, dynamic>> querySnapshot = await shopsCollection.get();

      final List<MyShop> shops = querySnapshot.docs.map((
          DocumentSnapshot<Map<String, dynamic>> doc) {
        return MyShop.fromEntity(MyShopEntity.fromDocument(doc.data()!));
      }).toList();

      return shops;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
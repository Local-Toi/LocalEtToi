import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../product_repository.dart';

class FirebaseProductRepository implements ProductRepository {
  FirebaseProductRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final productsCollection = FirebaseFirestore.instance.collection('products');

  @override
  Future<MyProduct> getProduct(String productId) async {
    try {
      return productsCollection.doc(productId).get().then(
            (value) => MyProduct.fromEntity(
              MyProductEntity.fromDocument(value.data()!),
            ),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setProductData(String productId, productData) {
    try {
      return productsCollection.doc(productId).set(productData);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> getProducer(String productId) {
    // TODO: implement getProducer
    throw UnimplementedError();
  }
}

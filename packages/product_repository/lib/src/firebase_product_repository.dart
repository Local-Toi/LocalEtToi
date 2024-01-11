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

  @override
  Future<void> addProduct(MyProduct product) async {
    await productsCollection.add({
      'name': product.name,
      'price': product.price,
      'description': product.description,
      'categories': product.categories,
      'labels': product.labels,
      'composition': product.composition,
      'image': product.image,
      'producerId': product.producerId,
    });
  }
}

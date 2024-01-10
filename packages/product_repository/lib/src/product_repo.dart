import 'package:firebase_auth/firebase_auth.dart';
import '../product_repository.dart';

abstract class ProductRepository {

  Future<MyProduct> getProduct(String productId);
  Future<void> setProductData(String productId, productData);
  Future<String> getProducer(String productId);
  Future<void> addProduct(MyProduct product);
}

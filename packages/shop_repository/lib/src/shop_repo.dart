import 'package:firebase_auth/firebase_auth.dart';
import '../shop_repository.dart';

abstract class ShopRepository {

  Future<MyShop> getShop(String shopId);
  Future<void> setShopData(String shopId, shopData);
}

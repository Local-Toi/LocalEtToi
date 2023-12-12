import '../shop_repository.dart';

abstract class ShopRepository {

  Future<MyShop> getShop(String shopId);
  Future<List<MyShop>> getAllShops();
  Future<void> setShopData(String shopId, shopData);
}

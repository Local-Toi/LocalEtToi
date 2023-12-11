import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shop_repository/shop_repository.dart';

import 'shop_event.dart';
import 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopRepository shopRepository;

  ShopBloc({required this.shopRepository}) : super(ShopLoading());

  @override
  Stream<ShopState> mapEventToState(
    ShopEvent event,
  ) async* {
    if (event is GetShop) {
      yield* _mapGetShopToState(event.shopId);
    } else if (event is SetShopData) {
      yield* _mapSetShopDataToState(event.shopId, event.shopData);
    }
  }

  Stream<ShopState> _mapGetShopToState(String shopId) async* {
    try {
      yield ShopLoading();
      final shop = await shopRepository.getShop(shopId);
      yield ShopLoaded(shop);
    } catch (e) {
      yield ShopError('Failed to load shop: $e');
    }
  }

  Stream<ShopState> _mapSetShopDataToState(String shopId, dynamic shopData) async* {
    try {
      await shopRepository.setShopData(shopId, shopData);
      final updatedShop = await shopRepository.getShop(shopId);
      yield ShopLoaded(updatedShop);
    } catch (e) {
      yield ShopError('Failed to set shop data: $e');
    }
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_repository/shop_repository.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopRepository shopRepository;

  ShopBloc({required this.shopRepository}) : super(ShopInitial());

  @override
  Stream<ShopState> mapEventToState(
      ShopEvent event,
      ) async* {
    if (event is FetchShop) {
      try {
        final MyShop shop = await shopRepository.getShop(event.shopId);
        yield ShopLoaded(shop: shop);
      } catch (e) {
        yield const ShopError(message: 'Failed to fetch shop data');
      }
    } else if (event is FetchAllShops) {
      try {
        final List<MyShop> shops = await shopRepository.getAllShops();
        yield ShopsLoaded(shops: shops);
      } catch (e) {
        yield const ShopError(message: 'Failed to fetch shops data');
      }
    }
  }
}

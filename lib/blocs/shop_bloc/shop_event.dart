part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class FetchShop extends ShopEvent {
  final String shopId;

  const FetchShop({required this.shopId});

  @override
  List<Object> get props => [shopId];
}

class FetchAllShops extends ShopEvent {}

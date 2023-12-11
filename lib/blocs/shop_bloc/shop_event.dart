import 'package:equatable/equatable.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object?> get props => [];
}

class GetShop extends ShopEvent {
  final String shopId;

  const GetShop(this.shopId);

  @override
  List<Object?> get props => [shopId];
}

class SetShopData extends ShopEvent {
  final String shopId;
  final dynamic shopData;

  const SetShopData(this.shopId, this.shopData);

  @override
  List<Object?> get props => [shopId, shopData];
}

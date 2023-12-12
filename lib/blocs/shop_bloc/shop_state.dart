part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopLoaded extends ShopState {
  final MyShop shop;

  const ShopLoaded({required this.shop});

  @override
  List<Object> get props => [shop];
}

class ShopsLoaded extends ShopState {
  final List<MyShop> shops;

  const ShopsLoaded({required this.shops});

  @override
  List<Object> get props => [shops];
}

class ShopError extends ShopState {
  final String message;

  const ShopError({required this.message});

  @override
  List<Object> get props => [message];
}

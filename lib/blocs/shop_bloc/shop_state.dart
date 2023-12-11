import 'package:equatable/equatable.dart';
import 'package:shop_repository/shop_repository.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object?> get props => [];
}

class ShopLoading extends ShopState {}

class ShopLoaded extends ShopState {
  final MyShop shop;

  const ShopLoaded(this.shop);

  @override
  List<Object?> get props => [shop];
}

class ShopError extends ShopState {
  final String message;

  const ShopError(this.message);

  @override
  List<Object?> get props => [message];
}

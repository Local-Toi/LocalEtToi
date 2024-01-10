import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyFavoriteShop extends Equatable {
  final String shopId;
  final String description;
  final String address;
  final String imageUrl;

  const MyFavoriteShop({
    required this.shopId,
    required this.description,
    required this.address,
    required this.imageUrl,
  });

  /// Creates a copy of the current [MyFavoriteShop] with its properties
  /// replaced by the values of their respective parameters.

  MyFavoriteShop copyWith({
    String? shopId,
    String? description,
    String? address,
    String? imageUrl,
  }) {
    return MyFavoriteShop(
      shopId: shopId ?? this.shopId,
      description: description ?? this.description,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  /// Creates an instance of [MyFavoriteShop] from a [MyFavoriteShopEntity]
  ///

  MyFavoriteShopEntity toEntity() {
    return MyFavoriteShopEntity(
      shopId: shopId,
      description: description,
      address: address,
      imageUrl: imageUrl,
    );
  }

  /// Creates an instance of [MyFavoriteShop] from a [MyFavoriteShopEntity]
  ///

  static MyFavoriteShop fromEntity(MyFavoriteShopEntity entity) {
    return MyFavoriteShop(
      shopId: entity.shopId,
      description: entity.description,
      address: entity.address,
      imageUrl: entity.imageUrl,
    );
  }

  @override
  List<Object?> get props => [shopId, description, address, imageUrl];
}

class MyFavoriteProduct extends Equatable {
  final String productId;
  final String productName;
  final String imageUrl;

  const MyFavoriteProduct({
    required this.productId,
    required this.productName,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [productId, productName, imageUrl];
}

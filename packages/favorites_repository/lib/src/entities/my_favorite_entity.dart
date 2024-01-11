import 'package:equatable/equatable.dart';

class MyFavoriteProductEntity extends Equatable {
  final String productId;
  final String productName;
  final String imageUrl;

  MyFavoriteProductEntity({
    required this.productId,
    required this.productName,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [productId, productName, imageUrl];
}

class MyFavoriteShopEntity extends Equatable {
  final String shopId;
  final String description;
  final String address;
  final String imageUrl;

  MyFavoriteShopEntity({
    required this.shopId,
    required this.description,
    required this.address,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [shopId, description, address, imageUrl];

  static MyFavoriteShopEntity fromDocument(Map<String, dynamic> map) {
    return MyFavoriteShopEntity(
      shopId: map['shopId'] as String,
      description: map['description'] as String,
      address: map['address'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'shopId': shopId,
      'description': description,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'MyFavoriteShopEntity { shopId: $shopId, description: $description, address: $address, imageUrl: $imageUrl }';
  }
}

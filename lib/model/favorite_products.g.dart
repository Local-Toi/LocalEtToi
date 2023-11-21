// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite_Product _$Favorite_ProductFromJson(Map<String, dynamic> json) =>
    Favorite_Product(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      productId: json['productId'] as int,
    );

Map<String, dynamic> _$Favorite_ProductToJson(Favorite_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'productId': instance.productId,
    };

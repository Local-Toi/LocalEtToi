// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_shops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite_shop _$Favorite_shopFromJson(Map<String, dynamic> json) =>
    Favorite_shop(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      shopId: json['shopId'] as int,
    );

Map<String, dynamic> _$Favorite_shopToJson(Favorite_shop instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'shopId': instance.shopId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      id_category: json['id_category'] as int,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      shopId: json['shopId'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'id_category': instance.id_category,
      'description': instance.description,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'shopId': instance.shopId,
      'image': instance.image,
    };

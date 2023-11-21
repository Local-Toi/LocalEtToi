// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      productId: json['productId'] as int,
      shopId: json['shopId'] as int,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'productId': instance.productId,
      'shopId': instance.shopId,
      'description': instance.description,
      'rating': instance.rating,
    };

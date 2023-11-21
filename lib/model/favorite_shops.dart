import 'package:json_annotation/json_annotation.dart';

part 'favorite_shops.g.dart';


@JsonSerializable()
class Favorite_shop{
  int id;
  int customerId;
  int shopId;

   Favorite_shop({
    required this.id,
    required this.customerId,
    required this.shopId,
  });

  Map<String, dynamic> toMap() => {
      'id': id,
      'customerId': customerId,
      'shopId': shopId,
    };

  factory Favorite_shop.fromJson(Map<String, dynamic> json) => _$Favorite_shopFromJson(json);

  Map<String, dynamic> toJson() => _$Favorite_shopToJson(this);


  @override
  String toString() {
    return 'Favorite Shop : {id: $id, customerId: $customerId, shopId: $shopId}';
  }
}


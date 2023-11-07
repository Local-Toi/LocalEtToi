import 'package:json_annotation/json_annotation.dart';


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

  Map<String, dynamic> toJson() => {
      'id': id,
      'customerId': customerId,
      'shopId': shopId,
    };


  @override
  String toString() {
    return 'Favorite Shop : {id: $id, customerId: $customerId, shopId: $shopId}';
  }
}

@JsonSerializable()
class Favorite_Product{
  int id;
  int customerId;
  int productId;

   Favorite_Product({
    required this.id,
    required this.customerId,
    required this.productId,
  });

  Map<String, dynamic> toJson() => {
      'id': id,
      'customerId': customerId,
      'productId': productId,
    };


  @override
  String toString() {
    return ' Favorite Product : {id: $id, customerId: $customerId, productId: $productId}';
  }
}
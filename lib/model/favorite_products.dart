import 'package:json_annotation/json_annotation.dart';

part 'favorite_products.g.dart';

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

  Map<String, dynamic> toMap() => {
      'id': id,
      'customerId': customerId,
      'productId': productId,
    };

  factory Favorite_Product.fromJson(Map<String, dynamic> json) => _$Favorite_ProductFromJson(json);

  Map<String, dynamic> toJson() => _$Favorite_ProductToJson(this);


  @override
  String toString() {
    return ' Favorite Product : {id: $id, customerId: $customerId, productId: $productId}';
  }
}
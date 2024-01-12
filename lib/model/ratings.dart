// Ce modèle n'est plus utilisé mais nous le gardons au cas où il viendrait à servir

import 'package:json_annotation/json_annotation.dart';

part 'ratings.g.dart';

@JsonSerializable()
class Rating {
  int id;
  int customerId;
  int productId;
  int shopId;
  String description;
  double rating;

   Rating({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.shopId,
    required this.description,
    required this.rating,
  });

  Map<String, dynamic> toMap() => {
      'id': id,
      'customerId': customerId,
      'productId': productId,
      'shopId': shopId,
      'description': description,
      'rating': rating,
    };

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);


  @override
  String toString() {
    return 'Rating : {id: $id, customerId: $customerId, productId: $productId, shopId: $shopId, description: $description, rating: $rating}';
  }
}
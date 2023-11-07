import 'package:json_annotation/json_annotation.dart';

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

  Map<String, dynamic> toJson() => {
      'id': id,
      'customerId': customerId,
      'productId': productId,
      'shopId': shopId,
      'description': description,
      'rating': rating,
    };


  @override
  String toString() {
    return 'Rating : {id: $id, customerId: $customerId, productId: $productId, shopId: $shopId, description: $description, rating: $rating}';
  }
}
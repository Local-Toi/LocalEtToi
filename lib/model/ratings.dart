class Ratings {
  int id;
  int customerId;
  int productId;
  int shopId;
  String description;
  float rating;

  const Ratings({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.shopId,
    required this.description,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
    return {
      'id': id,
      'customerId': customerId,
      'productId': productId,
      'shopId': shopId,
      'description': description,
      'rating': rating,
    };
  }

  @override
  String toString() {
    return 'Ratings : {id: $id, customerId: $customerId, productId: $productId, shopId: $shopId, description: $description, rating: $rating}';
  }
}
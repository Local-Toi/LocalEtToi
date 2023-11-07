class Favorites_shops{
  int id;
  int customerId;
  int shopId;

  const Favorites_shops({
    required this.id,
    required this.customerId,
    required this.shopId,
  });

  Map<String, dynamic> toJson() => {
    return {
      'id': id,
      'customerId': customerId,
      'shopId': shopId,
    };
  }

  @override
  String toString() {
    return 'Favorites_shops : {id: $id, customerId: $customerId, shopId: $shopId}';
  }
}

class Favorites_Products{
  int id;
  int customerId;
  int productId;

  const Favorites_Products({
    required this.id,
    required this.customerId,
    required this.productId,
  });

  Map<String, dynamic> toJson() => {
    return {
      'id': id,
      'customerId': customerId,
      'productId': productId,
    };
  }

  @override
  String toString() {
    return ' favorites_Products : {id: $id, customerId: $customerId, productId: $productId}';
  }
}
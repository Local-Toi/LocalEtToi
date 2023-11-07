class Product {
  int id;
  String name;
  int id_category;
  String description;
  float price;
  bool isAvailable;
  int shopId;
  String image;

  const Product({
    required this.id,
    required this.name,
    required this.id_category,
    required this.description,
    required this.price,
    required this.isAvailable,
    required this.shopId,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
    return {
      'id': id,
      'name': name,
      'id_category': id_category,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
      'shopId': shopId,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Product : {id: $id, name: $name, id_category: $id_category, description: $description, price: $price, isAvailable: $isAvailable, shopId: $shopId, image: $image}';
  }
}
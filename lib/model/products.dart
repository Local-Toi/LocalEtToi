import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';


@JsonSerializable()
class Product {
  int id;
  String name;
  int id_category;
  String description;
  double price;
  bool isAvailable;
  int shopId;
  String image;

   Product({
    required this.id,
    required this.name,
    required this.id_category,
    required this.description,
    required this.price,
    required this.isAvailable,
    required this.shopId,
    required this.image,
  });

  Map<String, dynamic> toMap() => {
      'id': id,
      'name': name,
      'id_category': id_category,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
      'shopId': shopId,
      'image': image,
    };

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);


  @override
  String toString() {
    return 'Product : {id: $id, name: $name, id_category: $id_category, description: $description, price: $price, isAvailable: $isAvailable, shopId: $shopId, image: $image}';
  }
}
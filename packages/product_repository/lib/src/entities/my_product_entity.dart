import 'package:equatable/equatable.dart';

class MyProductEntity extends Equatable {
  final String? name;
  final String? price;
  final String? quantity;
  final String? unit;
  final String? description;
  final List<dynamic>? categories;
  final List<dynamic>? labels;
  final String? composition;
  final String? image;
  final String producerId;

  const MyProductEntity({
    required this.name,
    required this.price,
    this.quantity,
    required this.unit,
    this.description,
    required this.categories,
    required this.labels,
    this.composition,
    this.image,
    required this.producerId,
  });

  Map<String, Object?> toDocument() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'categories': categories,
      'labels': labels,
      'composition': composition,
      'image': image,
      'producerId': producerId
    };
  }

  static MyProductEntity fromDocument(Map<String, Object?> doc) {
    return MyProductEntity(
      name: doc['name'] as String?,
      price: doc['price'] as String?,
      quantity: doc['quantity'] as String?,
      unit: doc['unit'] as String?,
      description: doc['description'] as String?,
      categories: doc['categories'] as List<dynamic>?,
      labels: doc['labels'] as List<dynamic>?,
      composition: doc['composition'] as String?,
      image: doc['image'] as String?,
      producerId: doc['producerId'] as String,
    );
  }

  @override
  List<Object?> get props => [name, price, quantity, unit, description, categories, labels, composition, image, producerId];

  @override
  String toString() {
    return 'UserEntity { name: $name, price: $price, quantity: $quantity, unit: $unit, description: $description, categories: $categories, labels: $labels, composition: $composition, image: $image, producerId: $producerId }';
  }
}

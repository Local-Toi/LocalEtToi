import 'package:equatable/equatable.dart';

class MyProductEntity extends Equatable {
  final String? name;
  final double? price;
  final String? description;
  final List<dynamic>? categories;
  final List<dynamic>? labels;
  final String? composition;
  final String? image;
  final String producerId;

  const MyProductEntity({
    required this.name,
    required this.price,
    required this.description,
    required this.categories,
    required this.labels,
    required this.composition,
    required this.image,
    required this.producerId,
  });

  Map<String, Object?> toDocument() {
    return {
      'name': name,
      'price': price,
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
      price: doc['price'] as double?,
      description: doc['description'] as String?,
      categories: doc['categories'] as List<dynamic>?,
      labels: doc['labels'] as List<dynamic>?,
      composition: doc['composition'] as String?,
      image: doc['image'] as String?,
      producerId: doc['producerId'] as String,
    );
  }

  @override
  List<Object?> get props => [name, price, description, categories, labels, composition, image, producerId];

  @override
  String toString() {
    return 'UserEntity { name: $name, price: $price, description: $description, categories: $categories, labels: $labels, composition: $composition, image: $image, producerId: $producerId }';
  }
}

import 'package:equatable/equatable.dart';

class MyProductEntity extends Equatable {
  final String id;
  final String? name;
  final double? price;
  final String? description;
  final List<dynamic>? categories;
  final List<dynamic>? labels;
  final String? composition;
  final String idProducer;
  final String? image;

  const MyProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.categories,
    required this.labels,
    required this.composition,
    required this.idProducer,
    required this.image,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'categories': categories,
      'labels': labels,
      'composition': composition,
      'idProducer': idProducer
    };
  }

  static MyProductEntity fromDocument(Map<String, Object?> doc) {
    return MyProductEntity(
      id: doc['id'] as String,
      name: doc['name'] as String?,
      price: doc['price'] as double?,
      description: doc['description'] as String?,
      categories: doc['categories'] as List<dynamic>?,
      labels: doc['labels'] as List<dynamic>?,
      composition: doc['composition'] as String?,
      idProducer: doc['idProducer'] as String,
      image: doc['image'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, price, description, categories, labels, composition, idProducer, image];

  @override
  String toString() {
    return 'UserEntity { id: $id, name: $name, price: $price, description: $description, categories: $categories, labels: $labels, composition: $composition, idProducer: $idProducer, image: $image }';
  }
}

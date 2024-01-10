import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyProduct extends Equatable {
  const MyProduct({required this.name, required this.price, required this.description, required this.categories, required this.labels, required this.composition, required this.image, required this.producerId});

  final String? name;
  final double? price;
  final String? description;
  final List<dynamic>? categories;
  final List<dynamic>? labels;
  final String? composition;
  final String? image;
  final String producerId;

  static const empty = MyProduct(
    name: '',
    price: 0,
    description: '',
    categories: [],
    labels: [],
    composition: '',
    image: '',
    producerId: '',
  );

  MyProduct copyWith({
    String? name,
    double? price,
    String? description,
    List<dynamic>? categories,
    List<dynamic>? labels,
    String? composition,
    String? image,
    required String producerId,
  }) {
    return MyProduct(
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      labels: labels ?? this.labels,
      composition: composition ?? this.composition,
      image: image ?? this.image,
      producerId: producerId
    );
  }

  bool get isEmpty => this == MyProduct.empty;
  bool get isNotEmpty => this != MyProduct.empty;

  MyProductEntity toEntity() {
    return MyProductEntity(
      name: name,
      price: price,
      description: description,
      categories: categories,
      labels: labels,
      composition: composition,
      image: image,
      producerId: producerId,
    );
  }

  @override
  List<Object> get props => [ name ?? '', price ?? '', description ?? '', categories ?? '', labels ?? '', composition ?? '', image ?? '', producerId];

  static fromEntity(fromDocument) {}
}

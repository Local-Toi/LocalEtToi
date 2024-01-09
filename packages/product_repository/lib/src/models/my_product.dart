import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyProduct extends Equatable {
  const MyProduct({required this.id, required this.name, required this.price, required this.description, required this.categories, required this.labels, required this.composition, required this.idProducer, required this.image});

  final String id;
  final String? name;
  final double? price;
  final String? description;
  final List<dynamic>? categories;
  final List<dynamic>? labels;
  final String? composition;
  final String idProducer;
  final String? image;

  static const empty = MyProduct(
    id: '',
    name: '',
    price: 0,
    description: '',
    categories: [],
    labels: [],
    composition: '',
    idProducer: '',
    image: '',
  );

  MyProduct copyWith({
    String? id = '',
    String? name,
    double? price,
    String? description,
    List<dynamic>? categories,
    List<dynamic>? labels,
    String? composition,
    String? idProducer,
    String? image,
  }) {
    return MyProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      labels: labels ?? this.labels,
      composition: composition ?? this.composition,
      idProducer: idProducer ?? this.idProducer,
      image: image ?? this.image,
    );
  }

  bool get isEmpty => this == MyProduct.empty;
  bool get isNotEmpty => this != MyProduct.empty;

  MyProductEntity toEntity() {
    return MyProductEntity(
      id: id,
      name: name,
      price: price,
      description: description,
      categories: categories,
      labels: labels,
      composition: composition,
      idProducer: idProducer,
      image: image
    );
  }

  @override
  List<Object> get props => [ id, name ?? '', price ?? '', description ?? '', categories ?? '', labels ?? '', composition ?? '', idProducer, image ?? ''];

  static fromEntity(fromDocument) {}
}

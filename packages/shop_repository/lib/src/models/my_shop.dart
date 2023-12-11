import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyShop extends Equatable {
  const MyShop({required this.id, required this.longitude, required this.latitude, this.name, this.description});

  final String id;
  final String longitude;
  final String latitude;
  final String? name;
  final String? description;

  static const empty = MyShop(
    id: '',
    longitude: '',
    latitude: '',
    name: '',
    description: '',
  );

  MyShop copyWith({
    String? id = '',
    String? longitude,
    String? latitude,
    String? name,
    String? description,
  }) {
    return MyShop(
      id: id ?? this.id,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  bool get isEmpty => this == MyShop.empty;
  bool get isNotEmpty => this != MyShop.empty;

  MyShopEntity toEntity() {
    return MyShopEntity(
      id: id,
      longitude: longitude,
      latitude: latitude,
      name: name,
      description: description,
    );
  }

  @override
  List<Object> get props => [longitude, latitude, name ?? '', description ?? ''];

  static fromEntity(fromDocument) {}
}

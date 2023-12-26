import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyShop extends Equatable {
  const MyShop({
    required this.id,
    required this.longitude,
    required this.latitude,
    this.name,
    this.description,
  });

  final String id;
  final double longitude;
  final double latitude;
  final String? name;
  final String? description;

  static const empty = MyShop(
    id: '',
    longitude: 0.0,
    latitude: 0.0,
    name: '',
    description: '',
  );

  /// Creates a copy of the current [MyShop] with its properties
  /// replaced by the values of their respective parameters.
  MyShop copyWith({
    String? id,
    double? longitude,
    double? latitude,
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

  /// Creates an instance of [MyShop] from a [MyShopEntity]
  MyShopEntity toEntity() {
    return MyShopEntity(
      id: id,
      longitude: longitude,
      latitude: latitude,
      name: name,
      description: description,
    );
  }

  /// Creates an instance of [MyShopEntity] from a [MyShop]
  static MyShop fromEntity(MyShopEntity entity) {
    return MyShop(
      id: entity.id,
      longitude: entity.longitude,
      latitude: entity.latitude,
      name: entity.name,
      description: entity.description,
    );
  }

  @override
  List<Object> get props => [longitude, latitude, name ?? '', description ?? ''];
}

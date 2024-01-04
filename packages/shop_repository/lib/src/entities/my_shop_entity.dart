import 'package:equatable/equatable.dart';

class MyShopEntity extends Equatable {
  final String id;
  final double longitude;
  final double latitude;
  final String? name;
  final String? description;

  const MyShopEntity({
    required this.id,
    required this.longitude,
    required this.latitude,
    this.name,
    this.description,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'longitude': longitude,
      'latitude': latitude,
      'name': name,
      'description': description,
    };
  }

  static MyShopEntity fromDocument(Map<String, Object?> doc) {
    return MyShopEntity(
      id: doc['id'] as String,
      longitude: doc['longitude'] as double,
      latitude: doc['latitude'] as double,
      name: doc['name'] as String?,
      description: doc['description'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, longitude, latitude, name, description];

  @override
  String toString() {
    return 'ShopEntity { id: $id, longitude: $longitude, latitude: $latitude, name: $name, description: $description }';
  }
}

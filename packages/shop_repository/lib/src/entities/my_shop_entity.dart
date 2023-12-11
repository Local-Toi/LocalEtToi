import 'package:equatable/equatable.dart';

class MyShopEntity extends Equatable {
  final String id;
  final String? longitude;
  final String? latitude;
  final String? name;
  final String? description;

  const MyShopEntity({
    required this.id,
    this.longitude,
    this.latitude,
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
      longitude: doc['longitude'] as String?,
      latitude: doc['latitude'] as String?,
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

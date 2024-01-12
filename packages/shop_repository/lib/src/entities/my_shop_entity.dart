import 'package:equatable/equatable.dart';

class MyShopEntity extends Equatable {
  final double longitude;
  final double latitude;
  final String? name;
  final String? description;
  final String? phonenumber;
  final String adresse;
  final double? note;
  final List<dynamic>? horaires;
  final String id;

  const MyShopEntity({
    required this.longitude,
    required this.latitude,
    required this.name,
    this.description,
    this.phonenumber,
    required this.adresse,
    this.note,
    this.horaires,
    required this.id,
  });

  Map<String, Object?> toDocument() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'name': name,
      'description': description,
      'phonenumber': phonenumber,
      'adresse': adresse,
      'note': 0,
      'horaires': horaires,
      'id': id,
    };
  }

  static MyShopEntity fromDocument(Map<String, Object?> doc) {
    return MyShopEntity(
      longitude: doc['longitude'] as double,
      latitude: doc['latitude'] as double,
      name: doc['name'] as String,
      description: doc['description'] as String?,
      phonenumber: doc['phonenumber'] as String?,
      adresse: doc['adresse'] as String,
      note: 0,
      horaires: doc['horaires'] as List<dynamic>?,
      id: doc['id'] as String,
    );
  }

  @override
  List<Object?> get props => [longitude, latitude, name, description, phonenumber, adresse, note, horaires, id];

  @override
  String toString() {
    return 'ShopEntity { longitude: $longitude, latitude: $latitude, name: $name, description: $description, phonenumber: $phonenumber, adresse: $adresse, note: $note, horaires: $horaires , id: $id}';
  }
}

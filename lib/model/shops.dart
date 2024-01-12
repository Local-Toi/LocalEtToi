// Ce modèle n'est plus utilisé mais nous le gardons au cas où il viendrait à servir

import 'package:json_annotation/json_annotation.dart';

part 'shops.g.dart';

@JsonSerializable()

class Shop {
  int id;
  int producerId;
  String name;
  String description;
  double latitude;
  double longitude;
  String address;
  String city;
  int postcode;

   Shop({
    required this.id,
    required this.producerId,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city,
    required this.postcode,
  });

  Map<String, dynamic> toMap() => {
      'id': id,
      'producerId': producerId,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'city': city,
      'postcode': postcode,
    };

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);


  @override
  String toString() {
    return 'Shop : {id: $id, producerId: $producerId, name: $name, description: $description, latitude: $latitude, longitude: $longitude, address: $address, city: $city, postcode: $postcode}';
  }
}
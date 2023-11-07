import 'package:json_annotation/json_annotation.dart';

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

  Map<String, dynamic> toJson() => {
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


  @override
  String toString() {
    return 'Shop : {id: $id, producerId: $producerId, name: $name, description: $description, latitude: $latitude, longitude: $longitude, address: $address, city: $city, postcode: $postcode}';
  }
}
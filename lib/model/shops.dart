class Shops {
  int id;
  int producerId;
  String name;
  String description;
  float latitude;
  float longitude;
  String address;
  String city;
  int postcode;

  const Shops({
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
    return {
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
  }

  @override
  String toString() {
    return 'Shops : {id: $id, producerId: $producerId, name: $name, description: $description, latitude: $latitude, longitude: $longitude, address: $address, city: $city, postcode: $postcode}';
  }
}
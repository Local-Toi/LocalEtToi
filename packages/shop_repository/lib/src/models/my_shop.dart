import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyShop extends Equatable {
  const MyShop({
    required this.id,
    required this.longitude,
    required this.latitude,
    this.name,
    this.description,
    this.phonenumber,
    required this.adresse,
    this.note,
    this.horaires,
  });

  final String id;
  final double longitude;
  final double latitude;
  final String? name;
  final String? description;
  final String? phonenumber;
  final String adresse;
  final double? note;
  final List<String>? horaires;

  static const empty = MyShop(
    id: '',
    longitude: 0.0,
    latitude: 0.0,
    name: '',
    description: '',
    phonenumber: '',
    adresse: '',
    note: 0.0,
    horaires: [],
  );

  /// Creates a copy of the current [MyShop] with its properties
  /// replaced by the values of their respective parameters.
  MyShop copyWith({
    String? id,
    double? longitude,
    double? latitude,
    String? name,
    String? description,
    String? phonenumber,
    String? adresse,
    double? note,
    List<String>? horaires,
  }) {
    return MyShop(
      id: id ?? this.id,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      name: name ?? this.name,
      description: description ?? this.description,
      phonenumber: phonenumber ?? this.phonenumber,
      adresse: adresse ?? this.adresse,
      note: note ?? this.note,
      horaires: horaires ?? this.horaires,
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
      phonenumber: phonenumber,
      adresse: adresse,
      note: note,
      horaires: horaires,
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
      phonenumber: entity.phonenumber,
      adresse: entity.adresse,
      note: entity.note,
      horaires: entity.horaires,
    );
  }

  @override
  List<Object> get props => [longitude, latitude, name ?? '', description ?? '', phonenumber ?? '', adresse, note ?? 0.0, horaires ?? []];
}

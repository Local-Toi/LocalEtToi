import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyShop extends Equatable {
  const MyShop({
    required this.longitude,
    required this.latitude,
    this.name,
    this.description,
    this.phonenumber,
    required this.adresse,
    this.note,
    this.horaires,
    required this.id,
  });

  final double longitude;
  final double latitude;
  final String? name;
  final String? description;
  final String? phonenumber;
  final String adresse;
  final double? note;
  final List<dynamic>? horaires;
  final String id;

  static const empty = MyShop(
    longitude: 0.0,
    latitude: 0.0,
    name: '',
    description: '',
    phonenumber: '',
    adresse: '',
    note: 0.0,
    horaires: [],
    id: '',
  );

  /// Creates a copy of the current [MyShop] with its properties
  /// replaced by the values of their respective parameters.
  MyShop copyWith({
    double? longitude,
    double? latitude,
    String? name,
    String? description,
    String? phonenumber,
    String? adresse,
    double? note,
    List<dynamic>? horaires,
    String? id,
  }) {
    return MyShop(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      name: name ?? this.name,
      description: description ?? this.description,
      phonenumber: phonenumber ?? this.phonenumber,
      adresse: adresse ?? this.adresse,
      note: note ?? this.note,
      horaires: horaires ?? this.horaires,
      id: id ?? this.id,
    );
  }

  bool get isEmpty => this == MyShop.empty;
  bool get isNotEmpty => this != MyShop.empty;

  /// Creates an instance of [MyShop] from a [MyShopEntity]
  MyShopEntity toEntity() {
    return MyShopEntity(
      longitude: longitude,
      latitude: latitude,
      name: name,
      description: description,
      phonenumber: phonenumber,
      adresse: adresse,
      note: note,
      horaires: horaires,
      id: id,
    );
  }

  /// Creates an instance of [MyShopEntity] from a [MyShop]
  static MyShop fromEntity(MyShopEntity entity) {
    return MyShop(
      longitude: entity.longitude,
      latitude: entity.latitude,
      name: entity.name,
      description: entity.description,
      phonenumber: entity.phonenumber,
      adresse: entity.adresse,
      note: entity.note,
      horaires: entity.horaires,
      id: entity.id,
    );
  }

  @override
  List<Object> get props => [longitude, latitude, name ?? '', description ?? '', phonenumber ?? '', adresse, note ?? 0.0, horaires ?? [], id ?? ''];
}

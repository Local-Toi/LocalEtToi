// Ce modèle n'est plus utilisé mais nous le gardons au cas où il viendrait à servir

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  DateTime birthdate;
  DateTime created;
  bool newsletter;
  bool isProducer;
  String image;

   User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.birthdate,
    required this.created,
    required this.newsletter,
    required this.isProducer,
    required this.image,
  });

  Map<String, dynamic> toMap() => {

    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'birthdate': birthdate,
    'created': created,
    'newsletter': newsletter,
    'isProducer': isProducer,
    'image': image,
  };

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


  @override
  String toString() {
    return 'User : { id: $id, firstName: $firstName, lastName: $lastName, email: $email, password: $password, birthdate: $birthdate, created: $created, newsletter: $newsletter, isProducer: $isProducer, image: $image }';
  }
}
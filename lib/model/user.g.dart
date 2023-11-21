// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      created: DateTime.parse(json['created'] as String),
      newsletter: json['newsletter'] as bool,
      isProducer: json['isProducer'] as bool,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'birthdate': instance.birthdate.toIso8601String(),
      'created': instance.created.toIso8601String(),
      'newsletter': instance.newsletter,
      'isProducer': instance.isProducer,
      'image': instance.image,
    };

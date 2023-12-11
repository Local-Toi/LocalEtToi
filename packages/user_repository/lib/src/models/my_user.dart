import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyUser extends Equatable {
  const MyUser({required this.id, required this.identifiant, this.email, this.firstName, this.lastName});

  final String id;
  final String identifiant;
  final String? email;
  final String? firstName;
  final String? lastName;

  static const empty = MyUser(
    id: '',
    identifiant: '',
    email: '',
    firstName: '',
    lastName: '',
  );

  MyUser copyWith({
    String? id = '',
    String? identifiant,
    String? email,
    String? firstName,
    String? lastName,
  }) {
    return MyUser(
      id: id ?? this.id,
      identifiant: identifiant ?? this.identifiant,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  bool get isEmpty => this == MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }

  @override
  List<Object> get props => [identifiant, email ?? '', firstName ?? '', lastName ?? ''];

  static fromEntity(fromDocument) {}
}

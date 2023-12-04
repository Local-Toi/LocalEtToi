import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyUser extends Equatable {
  const MyUser({required this.id, this.email, this.firstName, this.lastName});

  final String id;
  final String? email;
  final String? firstName;
  final String? lastName;

  static const empty = MyUser(
    id: '',
    email: '',
    firstName: '',
    lastName: '',
  );

  MyUser copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
  }) {
    return MyUser(
      id: id ?? this.id,
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
  List<Object> get props => [id, email ?? '', firstName ?? '', lastName ?? ''];

  static fromEntity(fromDocument) {}
}

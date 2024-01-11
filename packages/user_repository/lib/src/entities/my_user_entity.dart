import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final bool isProducer;
  final String? emailPro;
  final String? urlVerification;

  const MyUserEntity({
    required this.id,
    this.email,
    this.emailPro,
    this.firstName,
    this.lastName,
    this.urlVerification,
    required this.isProducer,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'isProducer': isProducer,
      'emailPro': emailPro,
      'urlVerification': urlVerification
    };
  }

  static MyUserEntity fromDocument(Map<String, Object?> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      email: doc['email'] as String?,
      firstName: doc['firstName'] as String?,
      lastName: doc['lastName'] as String?,
      isProducer: doc['isProducer'] as bool,
      emailPro: doc['emailPro'] as String?,
      urlVerification: doc['urlVerification'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, email, firstName, lastName, isProducer, emailPro, urlVerification];

  @override
  String toString() {
    return 'UserEntity { id: $id, email: $email, firstName: $firstName, lastName: $lastName , isProducer: $isProducer, emailPro: $emailPro , urlVerification: $urlVerification}';
  }
}

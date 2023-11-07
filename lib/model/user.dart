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

  const User({
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
  })

  Map<String, dynamic> toJson() => {

  return {
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
}

  @override
  String toString() {
    return 'User : { id: $id, firstName: $firstName, lastName: $lastName, email: $email, password: $password, birthdate: $birthdate, created: $created, newsletter: $newsletter, isProducer: $isProducer, image: $image }';
  }
}
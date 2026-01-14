class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String gender;
  final String birthdate;
  final String country;
  final String zipCode;
  final String address;
  final String? imagePath;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthdate,
    required this.country,
    required this.zipCode,
    required this.address,
    this.imagePath,
  });
}

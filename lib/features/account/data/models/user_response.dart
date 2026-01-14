class UserResponse {
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

  UserResponse({
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

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      birthdate: json['birthdate'],
      country: json['country'],
      zipCode: json['zipCode'],
      address: json['address'],
      imagePath: json['imageUrl'],
    );
  }
}

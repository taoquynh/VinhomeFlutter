class User {
  final int id;
  final String? createdAt;
  final String? createdBy;
  final String? modifiedAt;
  final String? modifiedBy;
  final String name;
  final String? dateOfBirth;
  final String? address;
  final bool? gender;
  final String phoneNumber;
  final String? email;
  final String? avatar;
  final String token;

  const User(
      {required this.id,
      this.createdAt,
      this.createdBy,
      this.modifiedAt,
      this.modifiedBy,
      required this.name,
      this.dateOfBirth,
      this.address,
      this.gender,
      required this.phoneNumber,
      this.email,
      this.avatar,
      required this.token});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        createdAt: json['createdAt'] as String,
        createdBy: json['createdBy'] as String,
        modifiedAt: json['modifiedAt'] as String,
        modifiedBy: json['modifiedBy'] as String,
        name: json['name'] as String,
        dateOfBirth: json['dateOfBirth'] as String,
        address: json['address'] as String,
        gender: json['gender'] as bool,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
        token: json['token'] as String);
  }
}

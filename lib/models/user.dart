class User {
  final int id;
  final String? createdAt;
  final String? createdBy;
  final String? modifiedAt;
  final String name;
  final String? dateOfBirth;
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
      required this.name,
      this.dateOfBirth,
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
        name: json['name'] as String,
        dateOfBirth: json['dateOfBirth'] as String,
        gender: json['gender'] as bool,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
        token: json['token'] as String);
  }
}

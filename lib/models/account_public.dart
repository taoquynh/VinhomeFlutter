class AccountPublic {
  final int? id;
  final String? name;
  final String? avatar;

  const AccountPublic({
    this.id,
    this.name,
    this.avatar,
  });

  factory AccountPublic.fromJSON(Map<String, dynamic> json) {
    return AccountPublic(
      id: json['id'] as int,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
    );
  }
}

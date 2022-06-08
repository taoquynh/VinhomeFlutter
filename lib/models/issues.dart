import 'package:vinhome/models/account_public.dart';

class Issue {
  final int? id;
  final String? createdAt;
  final String? createdBy;
  final String? title;
  final String? content;
  final List<String>? photos;
  final bool? isEnable;
  final int? status;
  final AccountPublic? accountPublic;

  const Issue(
      {this.id,
      this.createdAt,
      this.createdBy,
      this.title,
      this.content,
      this.photos,
      this.isEnable,
      this.status,
      this.accountPublic});

  factory Issue.fromJSON(Map<String, dynamic> json) {
    return Issue(
        id: json['id'] as int,
        createdAt: json['createdAt'] as String,
        createdBy: json['createdBy'] as String,
        title: json['title'] as String,
        content: json['content'] as String,
        photos: json['photos'] as List<String>,
        isEnable: json['isEnable'],
        status: json['status'] as int,
        accountPublic: json['accountPublic']);
  }
}

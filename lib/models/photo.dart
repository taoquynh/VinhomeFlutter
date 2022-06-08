class Photo {
  final String? contentType;
  final String? extension;
  final String? name;
  final String? size;
  final String? path;

  const Photo(
      {this.contentType, this.extension, this.name, this.size, this.path});

  factory Photo.fromJSON(Map<String, dynamic> json) {
    return Photo(
      contentType: json['contentType'] as String,
      extension: json['extension'] as String,
      name: json['name'] as String,
      size: json['size'] as String,
      path: json['path'] as String,
    );
  }
}

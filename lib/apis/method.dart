enum Method { get, post, put, delete }

extension MethodExtension on Method {
  String get text {
    switch (this) {
      case Method.get:
        return 'GET';
      case Method.post:
        return 'POST';
      case Method.put:
        return 'PUT';
      case Method.delete:
        return 'DELETE';
    }
  }
}

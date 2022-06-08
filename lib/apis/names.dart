class ApiName {
  static final ApiName _instance = ApiName._internal();

  factory ApiName() {
    return _instance;
  }

  ApiName._internal();

  final String domain = 'http://report.bekhoe.vn';

  final String login = '/api/accounts/Login';
  final String register = '/api/accounts/Register';
  final String getProfile = '/api/accounts/profile';
  final String updateProfile = '/api/accounts/update';
  final String changePassword = '/api/accounts/changePassword';
  final String getIssues = '/api/issues?limit=30&offset=0';
  final String createIssue = "/api/issues";
  final String upload = '/api/upload';

  String returnUrl(String nameRequest) {
    return domain + nameRequest;
  }
}

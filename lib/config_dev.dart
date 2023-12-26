// lib/config/config_dev.dart
class AppConfig {
  // api
  static const String baseUrl = 'https://api.example.com';
  static const int receiveTimeout = 15; // seconds
  static const int connectTimeout = 30; // seconds
  // db
  static const String hiveBaseBoxName = 'app_box';
//   route
  static String root = "/";
  static String pageToRedirectTo = "/pageToRedirectTo";
}

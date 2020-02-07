// import 'package:sapawarga/configs/FlavorConfig.dart';

import 'package:flutter_starter_kit/environment/Environment.dart';

class EndPointPath {
  // static String baseUrl = FlavorConfig.instance.values.baseUrl;
  // static String apiStorage = FlavorConfig.instance.values.apiStorage;
  static String baseUrl = Environment.apiStaging;
  static String apiStorage = Environment.apiStagingStorage;
  static String getVersion = apiStorage + '/version.json';
  static String login = baseUrl + '/user/login';
  static String logout = baseUrl + '/user/logout';
  static String profile = baseUrl + '/user/me';
}

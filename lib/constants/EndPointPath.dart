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
  static String changePassword = profile + '/change-password';
  static String changeProfile = profile + '/change-profile';
  static String profilePhotoUpdate = profile + '/photo';
  static String phoneBook = baseUrl + '/phone-books';
  static String news = baseUrl + '/news';
  static String newsRelated = baseUrl + '/news/related';
  static String newsFeatured = baseUrl + '/news/featured';
  static String survey = baseUrl + '/survey';
  static String polling = baseUrl + '/polling';
  static String videos = baseUrl + '/videos';
  static String counterHoax = baseUrl + '/news-hoax';
  static String usulan = baseUrl + '/aspirasi';
  static String categoryUsulan = baseUrl + '/categories';
  static String messages = baseUrl + '/user-messages';
  static String broadcasts = baseUrl + '/broadcasts';
  static String banner = baseUrl + '/banners';
  static String attachment = baseUrl + '/attachments';
  static String popupInformation = baseUrl + '/popups';
  static String notifications = baseUrl + '/notifications';
  static String importantInfo = baseUrl + '/news-important';

  // get Educations List
  static String educations = baseUrl + '/education-levels';
  // get Jobs List
  static String jobs = baseUrl + '/job-types';
}

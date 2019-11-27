import 'dart:convert';

import 'package:flutter_starter_kit/constants/preferencesName.dart';
import 'package:flutter_starter_kit/models/userInfoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  // ============== TOKEN ======================
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(PreferencesName.token, token);
    return;
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(PreferencesName.token);
  }

  static Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(PreferencesName.token) == null ? false : true;
  }
  // ============== TOKEN ======================

  // ============== USER INFO ======================

  static Future<void> setUserInfo(UserInfoModel authUserInfo) async {
    final prefs = await SharedPreferences.getInstance();

    Map authUserInfoJson = authUserInfo.toJson();

    await prefs.setString(
        PreferencesName.userInfo, json.encode(authUserInfoJson));
  }

  static Future<UserInfoModel> getLocalUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String userInfoJsonString = prefs.getString(PreferencesName.userInfo);

    Map userInfoMap = json.decode(userInfoJsonString);

    return UserInfoModel.fromJson(userInfoMap);
  }

  static Future<bool> hasLocalUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(PreferencesName.userInfo) == null ? false : true;
  }
  // ============== USER INFO ======================
}

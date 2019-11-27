import 'dart:convert';
import 'package:flutter_starter_kit/constants/EndPointPath.dart';
import 'package:flutter_starter_kit/constants/ErrorException.dart';
import 'package:flutter_starter_kit/constants/HttpHeaders.dart';
import 'package:flutter_starter_kit/models/userInfoModel.dart';
import 'package:flutter_starter_kit/utilities/exceptions/ValidationException.dart';
import 'package:flutter_starter_kit/utilities/sharedPreferences/authPreferences.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
    String fcmToken,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    Map requestData = {
      'LoginForm': {
        'username': username,
        'password': password,
        'push_token': fcmToken
      }
    };

    var requestBody = json.encode(requestData);

    var response = await http
        .post('${EndPointPath.login}',
            headers: await HttpHeaders.headers(), body: requestBody)
        .timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);

      return responseData['data']['access_token'];
    }

    if (response.statusCode == 422) {
      Map<String, dynamic> responseData = json.decode(response.body);

      throw ValidationException(responseData['data']);
    }

    throw Exception(ErrorException.loginException);
  }

  Future<UserInfoModel> fetchUserInfo() async {
    await Future.delayed(Duration(seconds: 1));

    String token = await AuthPreferences.getToken();

    var response = await http.get(
      '${EndPointPath.profile}',
      headers: await HttpHeaders.headers(token: token),
    );

    Map userInfoMap = json.decode(response.body)['data'];

    return UserInfoModel.fromJson(userInfoMap);
  }

  Future<UserInfoModel> getUserInfo({bool forceFetch = false}) async {
    UserInfoModel authUserInfo;

    bool hasUserInfo = await AuthPreferences.hasLocalUserInfo();

    if (hasUserInfo == false || forceFetch == true) {
      authUserInfo = await fetchUserInfo();
      await AuthPreferences.setUserInfo(authUserInfo);
    } else {
      authUserInfo = await AuthPreferences.getLocalUserInfo();
    }

    return authUserInfo;
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagifiles/screens/home_screen.dart';
import 'package:tagifiles/screens/welcome_screen.dart';

class ApiService {

//Done
  /// Login
  Future<void> login({
    required String email,
    password,
    required BuildContext context,
    required ValueSetter onSuccess,
  }) async {
    String serverPayload = json.encode({
      'email': email,
      'password': password,
      "sub_domain": "",
      "tf_name": "",
      'captcha': "xyz"
    });

    try {
      Response response = await post(
          Uri.parse(
              // 'https://kong.tagifiles.io/tf/private/api/service/dev/v1/user/v1/login/with/tagifiles/'
                  'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/user/v1/login/'
          ),
          body: serverPayload,
          headers: {
            "Content-Type": "application/json",
            // "Authorization": "99bc42d1122355ce54ff030bba148c2772600379",
          });

      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['token'];
        await saveTokenToPrefs(token);
        print("Login successfully ${response.statusCode} + ${response.body}");
        onSuccess.call(response.body);
        return token;
        var logindata = jsonDecode(response.body.toString());
        // print(logindata['token']);
      } else {
        await Fluttertoast.showToast(
            msg: 'Something went wrong!', toastLength: Toast.LENGTH_SHORT);
        print(
            'Login Failed with state code: ${response.statusCode} ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> saveTokenToPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchDataAfterLogin() async {
    String? token = await getTokenFromPrefs();

    if (token != null) {
      final url = Uri.parse(
          'https://kong.tagifiles.io/tf/private/api/service/dev/v1/user/v1/login/with/tagifiles/');

      final response = await http.get(
        url,
        headers: {'Authorization': '$token'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print('Fetched data after login: $jsonData');
      } else {
        print(
            'Failed to fetch data after login with status: ${response.statusCode}');
      }
    } else {
      print('Token not found. User not logged in.');
    }
  }

  /// Sign_Up
  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    gender,
    required ValueSetter onSuccess,
  }) async {
    String serverpayLoad1 = json.encode({
      'email': email,
      'first_name': firstName,
      'gender': "",
      'last_name': lastName,
      'password': password
    });

    try {
      Response response = await post(
        Uri.parse(
            'https://kong.tagifiles.io/tf/private/api/service/dev/v1/user/v1/create/'),
        body: serverpayLoad1,
        // headers:  {"Content-Type": "application/json;charset=utf-8"}
        headers: {"Content-Type": "application/json"},
      );
      // print("++++++++++++++++++++++++++++++++++++++");
      // print(response.body);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        onSuccess.call(response.body);
      } else {
        print(response.body);
        print(response.statusCode);
      }
    } catch (e) {
      print('Sign_up Error: $e');
    }
  }
}

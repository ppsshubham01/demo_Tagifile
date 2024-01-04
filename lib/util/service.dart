import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagifiles/model/user_data.dart';
import 'package:tagifiles/screens/home_screen.dart';
import 'package:tagifiles/screens/welcome_screen.dart';

class ApiService {
// login done
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
      Response response = await post(Uri.parse(
              // 'https://kong.tagifiles.io/tf/private/api/service/dev/v1/user/v1/login/with/tagifiles/'
              'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/user/v1/login/'),
          body: serverPayload,
          headers: {
            "Content-Type": "application/json",
            // "Authorization": "99bc42d1122355ce54ff030bba148c2772600379",
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['data'];
        print("+++++++++++++++++++++++++++");
        print(token);
        await saveTokenToPrefs(token);
        print("Login successfully ${response.statusCode} + ${response.body}");
        onSuccess.call(response.body);
        return token;
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

  ///token
  Future<void> saveTokenToPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }


  /// model object
  Future<void> saveModelObjectToPrefs(Model modelData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('model', json.encode(modelData));
  }

  Future<Model> getModelObjectToPrefs(Model modelData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString('model').toString());
  }

  Future<void> fetchDataAfterLogin() async {
    String? token = await getTokenFromPrefs();

    if (token != null) {
      // final url = Uri.parse('https://kong.tagifiles.io/tf/private/api/service/dev/v1/user/v1/login/with/tagifiles/');
      final url = Uri.parse(
          'http://192.168.1.142:8001/tf/core/api/service/dev/v1/personal/content/v1/list_content/');

      final String body = json.encode({
        "parent_id": 0,
        "sort_order": "NULL",
        "sort_by": "NULL",
        "filter_by": "",
        "content_path": "",
        "only_dirs": false,
        "page_range": {"pg_from": 0, "pg_to": 100},
        "org_id": -1,
        "page_data": {
          "next_files_from": 0,
          "next_files_till": 20,
          "next_folders_from": 0,
          "next_folders_till": 20,
          "next_files_only": false,
          "next_folders_only": false,
          "file_sort_key": "NAME",
          "file_sort_order": "ASC",
          "folder_sort_key": "NAME",
          "folder_sort_order": "ASC"
        }
      });
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Token $token',
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: body,
      );
      // print("-------------------------------------------");
      // print(response.statusCode);
      // print(response.body);

      if (response.statusCode == 200) {
        /// dataStored In Object
        final jsonData = jsonDecode(response.body);
        Model resultData = Model.fromJson(jsonData);
        print(resultData);
        await saveModelObjectToPrefs(resultData);
        print('Fetched data after login: $jsonData');
      } else {
        print('Failed to fetch data after login with status: ${response.statusCode}');
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
            // 'https://kong.tagifiles.io/tf/private/api/service/dev/v1/user/v1/create/'
            'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/user/v1/create/'),
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

  /// Log-Out
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}

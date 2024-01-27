import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagifiles/model/userDetails.dart';
import 'package:tagifiles/model/user_data.dart';

class ApiService with ChangeNotifier {
  String? _tokenKey = 'jaimin';

  bool get isToken {
    return _tokenKey != null;
  }

  // flutter_launcher_icons: ^0.13.1
  //

  /// ########################  Login
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
    required ValueSetter onSuccess,
    required ValueSetter onError,
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
        _tokenKey = token;
        notifyListeners();
        // print("+++++++++++++++++++++++++++");
        // print(token);
        await saveTokenToPrefs(token);
        print("Login successfully ${response.statusCode} + ${response.body}");
        onSuccess.call(response.body);
        return token;
      } else {
        // await Fluttertoast.showToast(msg: 'Something went wrong!', toastLength: Toast.LENGTH_SHORT);
        // const SnackBar(content: Text("Error....", style: TextStyle(fontSize: 15.0),),backgroundColor: Colors.redAccent,);
        print(
            'Login Failed with state code: ${response.statusCode} ${response.body}');
        return null;
      }
    } catch (e) {
      onError.call("");
      print('Error: $e');
    }
  }

  /// ######################## token
  Future<void> saveTokenToPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  /// ########################  model object
  Future<void> saveModelObjectToPrefs(Model modelData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('model', json.encode(modelData));
  }

  Future<Model> getModelObjectToPrefs(Model modelData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString('model').toString());
  }

  /// ######################## fetchDataAfterLogin
  Future<Model> fetchDataAfterLogin() async {
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
        return resultData;
      } else {
        print(
            'Failed to fetch data after login with status: ${response.statusCode}');
      }
    } else {
      print('Token not found. User not logged in.');
    }
    return Model();
  }

  /// #######################ListContent for the contentPath
  Future<Model> fetchListContent() async {
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
        "org_id": null
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
        return resultData;
      } else {
        print(
            'Failed to fetch data after login with status: ${response.statusCode}');
      }
    }
    return Model();
  }

  /// ########################  Sign_Up
  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    gender,
    required ValueSetter onSuccess,
    required ValueSetter onError,
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
      onError.call("");
      print('Sign_up Error: $e');
    }
  }

  /// ######################## Log-Out
  Future<void> logout() async {
    _tokenKey = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return false;
    }
    _tokenKey = await getTokenFromPrefs();
    notifyListeners();
    return true;
  }

  ///########################## Forgot Password
  Future<void> forgotPassword({
    required String forgotPasswordEmailPhone,
    String? resetMethod,
  }) async {
    String forgotServerPayload = json.encode({
      'forget_password_email_phone_input': forgotPasswordEmailPhone,
      'reset_method': resetMethod
    });
    try {
      Response response = await post(
          Uri.parse(
              'http://192.168.1.142:8001/api/v1/auth/forget_pwd_send_code/'),
          body: forgotServerPayload,
          headers: {'Content-Type': 'application/json;charset=utf-8'});

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
        print(response.headers);
      }
    } catch (e) {
      print('forgot Password error'!);
    }
  }

  /// newFolder
  Future<void> newFolder({
    required String foldername,
    required int destinationFolderId,
    int? orgOwnerId,
    int? organisationId,
    int? groupId,
    int? relationId,
    required ValueSetter onSuccess,
    required ValueSetter onError,
  }) async {
    String? token = await getTokenFromPrefs();
    String crateserverpayload = json.encode({
      'folder_name': foldername,
      'destination_folder_id': destinationFolderId,
      'org_owner_id': orgOwnerId,
      'organisation_id': organisationId,
      'group_id': groupId,
      'relation_id': relationId
    });

    try {
      Response response = await post(
          Uri.parse(
              'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/personal/content/folder/v1/create/'),
          body: crateserverpayload,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $token',
          });

      if (response.statusCode == 200) {
        print(response.body);
        onSuccess.call(response.body);
      } else {
        print(response.statusCode);
        print('--------------------------------------------------------------');
        print(response.body);
      }
    } catch (e) {
      onError.call('Error Occurred!');
      print('Folder error!');
    }
  }

  /// removeFolder
// Payload :--------- {files: [], folders: [37295]}
//   Future<void> removeFolder({int? files, int? folders,required ValueSetter onSuccess,
//     required ValueSetter onError,}) async {
//     String? token = await getTokenFromPrefs();
//     String removeServerpayload =
//         json.encode({"files": files, "folders": folders});
//     try {
//       Response response = await post(
//           Uri.parse(
//               'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/personal/content/folder/v1/remove/'),
//           body: removeServerpayload,
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Token $token',
//           });
//
//       if (response.statusCode == 200) {
//         print(response.body);
//       } else {
//         print(response.statusCode);
//         print('------------------');
//         print(response.body);
//       }
//     } catch (e) {
//       print('Folder error!');
//     }
//   }

  Future<void> removeFolder({int? files, int? folders,required ValueSetter onSuccess,
    required ValueSetter onError,}) async {
    String? token = await getTokenFromPrefs();
    String removeServerpayload =
        json.encode({"files": [files], "folders": [folders]});
    try {
      Response response = await post(
          Uri.parse(
              'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/personal/content/folder/v1/remove/'),
          body: removeServerpayload,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $token',
          });

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
        print('--------------- ---');
        print(response.body);
      }
    } catch (e) {
      print('Folder error!');
    }
  }

  // name: krishna.jpg
  // B_size: 70008
  // upload_to: 36206
  // type: image/jpeg
  // directory_path:
  // file: (binary)
  // org_id:
  // org_owner_id:
  // Response:--- {"data":195689,"message":"OK","status":200}
  Future<void> fileUpload({
    required String name,
    int? bsize,
    int? uploadTo,
    String? type,
    String? directoryPath,
    String? file,
    String? orgId,
    String? orgOwnerId,
  }) async {
    String uploadServerpayload = json.encode({
      'name': name,
      'B_size': bsize,
      'upload_to': uploadTo,
      'type': type,
      'directory_path': directoryPath,
      'file': file,
      'org_id': orgId,
      'org_owner_id': orgOwnerId,
    });

    MultipartRequest request = await http.MultipartRequest(
      "POST",
      Uri.parse(
          'http://192.168.1.142:8006/tf/core/api/service/dev/v1/personal/content/file/v1/upload/'),
      // body: uploadServerpayload,
      // headers: { 'Content-Type': 'multipart/form-data; boundary=----WebKitFormBoundarywi229qlFZwAtkioi'}
    );
    request.files.add(await http.MultipartFile.fromPath("file", "filePath"));
    StreamedResponse response = await request.send();
  }

  ///Ferching userDetails
  Future<UserdetailsModel> serviceUserDetails() async {
    String? userToken = await getTokenFromPrefs();
    try {
      Response response = await http.get(
        Uri.parse(
            "http://192.168.1.142:8000/tf/core/api/service/dev/v1/user/v1/details/"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $userToken',
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("==============================================");
        print(response.body);
        print(response.statusCode);
        print(response.headers);
        return UserdetailsModel.fromJson(responseData);
      } else {
        throw Exception(
            'Failed to load user details, status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('an error occurred: $error');
    }
  }
}

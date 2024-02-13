import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagifiles/model/chat_PageModel.dart';
import 'package:tagifiles/model/userDetails.dart';
import 'package:tagifiles/model/user_data.dart';

import '../model/collaborateModel.dart';
import '../model/global_SearchModel.dart';
import '../screens/auth/welcome_screen.dart';

class ApiService with ChangeNotifier {
  String? _tokenKey;

  bool get isToken {
    return _tokenKey != null;
  }

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
        // print("Login successfully ${response.statusCode} + ${response.body}");
        onSuccess.call(response.body);
        return token;
      } else {
        // await Fluttertoast.showToast(msg: 'Something went wrong!', toastLength: Toast.LENGTH_SHORT);
        // const SnackBar(content: Text("Error....", style: TextStyle(fontSize: 15.0),),backgroundColor: Colors.redAccent,);
        // print('Login Failed with state code: ${response.statusCode} ${response.body}');
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

      if (response.statusCode == 200) {
        /// dataStored In Object
        final jsonData = jsonDecode(response.body);
        Model resultData = Model.fromJson(jsonData);
        // print(resultData);
        await saveModelObjectToPrefs(resultData);
        // print('Fetched data after login: $jsonData');
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

  /// ----------------------- listContent for the ## contentPath ##
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
        // print(resultData);
        await saveModelObjectToPrefs(resultData);
        // print('Fetched data after login: $jsonData');
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
        // print(response.body);
        onSuccess.call(response.body);
      } else if (response.statusCode == 400) {
        // print(response.body);
        // print(response.statusCode);
        onError.call("");
      }
    } catch (e) {
      onError.call("");
      print('Sign_up Error: $e');
    }
  }

  /// ######################## Log-Out & Auto-logIn
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
        // print(response.body);
      } else {
        // print(response.statusCode);
        // print(response.headers);
      }
    } catch (e) {
      print('forgot Password error');
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

      if (response.statusCode == 201) {
        // print(response.body);
        onSuccess.call('');
      } else {
        // print(response.statusCode);
        // print('--------------------------------------------------------------');
        // print(response.body);
        onError.call("");
      }
    } catch (e) {
      onError.call('Error Occurred!');
      print('Folder error!');
    }
  }

  /// -------------deleteFolder
  Future<void> removeFolder({
    List<int>? files,
    List<int>? folders,
    required ValueSetter onSuccess,
    required ValueSetter onError,
  }) async {
    String? token = await getTokenFromPrefs();
    String removeServerpayload =
        json.encode({"files": files, "folders": folders});
    // print('-+++++++++++++++++++++++++++++++++++++-----------------------------------');
    // print(removeServerpayload);
    try {
      Response response = await post(
          Uri.parse(
              'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/personal/content/folder/v1/remove/'),
          body: removeServerpayload,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $token',
          });

      // print(response.statusCode);
      if (response.statusCode == 200) {
        // print(response.body);
        onSuccess.call('');
      } else {
        // print(response.statusCode);
        // print('--------------- ---');
        onError.call('');
        // print(response.body);
      }
    } catch (e) {
      print('Folder error!');
    }
  }

  ///Upload
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
        // print(response.body);
        // print(response.statusCode);
        // print(response.headers);
        return UserdetailsModel.fromJson(responseData);
      } else {
        throw Exception(
            'Failed to load user details, status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('an error occurred: $error');
    }
  }

  /// CollaborateChat
  Future<Map<String, dynamic>> collaborateDetailsChat() async {
    String? userToken = await getTokenFromPrefs();
    try {
      Response response = await http.get(
        Uri.parse(
            "http://192.168.1.142:8004/tf/core/api/service/dev/v1/chats/v1/collaborators/get/?"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $userToken',
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // print("#################_______________-----------------------------------------------------------------------------------");
        // print("sevice response Data: $responseData");
        // print(response.statusCode);
        // return CollaborateModel().fromJson(responseData);
        return responseData['data'];
      } else {
        throw Exception(
            'Failed to load user details, status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('an error occurred: $error');
    }
  }

  /// CharPage
  Future<ChatPage?> chatPageDetails({
    int? messageToId,
    bool? inGroup,
    int? rangeFrom,
    int? rangeTo,
    String? tfName,
    String? orgId,
    String? messageId,
  }) async {
    String? token = await getTokenFromPrefs();
    String chatPageserverpayload = json.encode({
      'message_to_id': messageId,
      'in_group': inGroup ?? false,
      'range_from': rangeFrom ?? 0,
      'range_to': rangeTo ?? 20,
      'tf_name': tfName,
      'org_id': orgId,
      'message_id': messageId
    });

    Response response = await post(
        Uri.parse(
            'http://192.168.1.142:8004/tf/core/api/service/dev/v1/chats/v1/messages/get/'),
        body: chatPageserverpayload,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        });

    try {
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(response.body);
        print("responseData: $responseData");
        ChatPage resultData = ChatPage.fromJson(responseData);
        return resultData;
      } else {
        print(response.statusCode);
        print(response.headers);
        print("Failed to get chatingPage ChatData");
      }

    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ///GlobalSearch
  /// NOte -PAggination parames not validated from server(range still Pass from 0)
  Future<GlobalSearch?> globalSearch({
    List<String>? keyword,
    List<dynamic>? tags,
    List<String>? types,
    List<int>? from,
    List<int>? to,
    List<int>? iN,
    bool? searchInChats,
    String? orgId,
    String? viewMore,
    bool? content,
    bool? groups,
    bool? people,
    bool? organisations,
    bool? chat,
    String? nonContentPageData,
    int? rangeFrom,
    int? rangeTo,
    String? sortKey,
    String? sortOrder,
    String? contentPagination,
    String? values,
    int? nextFilesFrom,
    int? nextFilesTill,
    int? nextFoldersFrom,
    int? nextFoldersTill,
    bool? nextFilesOnly,
    bool? nextFoldersOnly,
    String? fileSortKey,
    String? fileSortOrder,
    String? folderSortKey,
    String? folderSortOrder,
    bool? isPersonal,
  }) async {
    String? token = await getTokenFromPrefs();
    print(token);

    String globalSearchPayload = json.encode(
        {
      "keywords": keyword ?? [],
      "tags": tags ?? [],
      "types": types ?? [],
      "from": from ?? [],
      "to": to ?? [],
      "in": iN ?? [],
      "search_in_chats": searchInChats ?? false,
      "org_id": orgId,
      "view_more": {
        "content": content ?? false,
        "groups": groups ?? false,
        "people": people ?? false,
        "organisations": organisations ?? false,
        "chats": chat ?? false,
        "non_content_page_data": {
          "range_from": rangeFrom ?? 0,
          "range_to": rangeTo ?? 20,
          "sort_key": sortKey,
          "sort_order": sortOrder
        },
        "content_pagination": {
          "next_files_from": nextFilesFrom ?? 0,
          "next_files_till": nextFilesTill ?? 20,
          "next_folders_from": nextFoldersFrom ?? 0,
          "next_folders_till": nextFoldersTill ?? 20,
          "next_files_only": nextFilesOnly ?? false,
          "next_folders_only": nextFoldersOnly ?? false,
          "file_sort_key": fileSortKey,
          "file_sort_order": fileSortOrder,
          "folder_sort_key": folderSortKey,
          "folder_sort_order": folderSortOrder
        }
      },
      "is_personal": isPersonal ?? false
    });

    print(globalSearchPayload);
    print("------------------------THIS IS sEARCH #################_________----------------");
    // {"keywords":["a"],"tags":[],"types":[],"from":[],"to":[],"in":[],
    // "search_in_chats":false,"org_id":null,
    // "view_more":{"content":false,"groups":false,"people":false,"organisations":false,"chats":false,
    // "non_content_page_data":{"range_from":0,"range_to":20,"sort_key":null,"sort_order":null},
    // "content_pagination":{"next_files_from":0,"next_files_till":20,
    // "next_folders_from":0,"next_folders_till":20,"next_files_only":false,
    // "next_folders_only":false,"file_sort_key":null,"file_sort_order":null,
    // "folder_sort_key":null,"folder_sort_order":null}},"is_personal":false}

    Response response = await post(
        Uri.parse(
            'http://192.168.1.142:8080/tf/micro/api/service/dev/v1/search/global/'),
        body: globalSearchPayload,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        });

    try {
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(response.body);
        print("responseData: $responseData");
        // return responseData[];
        // return GlobalSearch.fromJson(responseData);
        GlobalSearch resultData = GlobalSearch.fromJson(responseData);
        return resultData;
      } else {
        print(response.statusCode);
        print(response.headers);
        print("Failed to get globalData");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

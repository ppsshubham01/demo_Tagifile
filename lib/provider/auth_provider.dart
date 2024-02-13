import 'package:flutter/material.dart';
import 'package:tagifiles/model/chat_PageModel.dart';
import 'package:tagifiles/model/global_SearchModel.dart';
import 'package:tagifiles/model/userDetails.dart';
import 'package:tagifiles/model/user_data.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';
import 'package:tagifiles/screens/home/home_screen.dart';
import 'package:tagifiles/screens/home/tabs/personal_tab.dart';
import 'package:tagifiles/services/service.dart';
import 'package:tagifiles/util/dialog_box.dart';

import '../model/collaborateModel.dart';

class AuthProvider with ChangeNotifier {
  /// for signUp
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// for signIn
  final TextEditingController emailController2 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  /// for handling loadingIndigator
  bool loginLoading = false;
  bool signUpLoading = false;
  bool deleteLoading = false;
  bool createFolderLoading = false;

  /// forgotPassword Emailtext
  final TextEditingController forgorPasswordText = TextEditingController();

  /// for focusIcon
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isSelected = true;

  /// for the fetchingData
  Model ffetchDataafterLogin = Model();
  var finalListContentData;

  ///
  List<Result> fileList = [];
  List<Result> folderList = [];

  /// for signUp method
  void signUpUser(BuildContext context) {
    signUpLoading = true;
    notifyListeners();
    ApiService().signup(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      onSuccess: (value) {
        signUpLoading = false;
        notifyListeners();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
      },
      onError: (value) async {
        signUpLoading = false;
        notifyListeners();
        PopDialog().signupMyDialog(context);
      },
    );
  }

  /// for signIn method
  void signInUser(BuildContext context) {
    loginLoading = true;
    notifyListeners();
    ApiService().login(
      email: emailController2.text,
      password: passwordController2.text,
      context: context,
      onSuccess: (value) {
        loginLoading = false;
        notifyListeners();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      },
      onError: (value) async {
        loginLoading = false;
        notifyListeners();
        PopDialog().showMyDialog(context);
        // await Fluttertoast.showToast(msg: 'LogIn password/email is wrong!', toastLength: Toast.LENGTH_SHORT );
      },
    );
  }

  void forgotPassword(BuildContext context) {
    /// Preview for the  save in object new created folder
    // {msg: "Created folder successfully!",…}
    // data: {is_directory: true, content_name: "abc", content_size: 0, content_id: 37292, content_thumbnails: [],…}
    // content_id: 37292
    // content_name: "abc"
    // content_parent_id: 36206
    // content_path: "Tagifiles/abc/"
    // content_size: 0
    // content_thumbnails: []
    // is_directory: true
    // organisation_id: -1
    // errors: null
    // msg: "Created folder successfully!"
    // status: 201
    ApiService()
        .forgotPassword(forgotPasswordEmailPhone: forgorPasswordText.text);
  }

  void fetchDataaafterLogin() async {
    final fetchedDataAfterLogin = await ApiService().fetchDataAfterLogin();
    ffetchDataafterLogin = fetchedDataAfterLogin;
    print(ffetchDataafterLogin.sharingData);
    fileList.clear();
    folderList.clear();
    notifyListeners();
    ffetchDataafterLogin.result?.forEach((element) {
      if (element.isFile) {
        fileList.add(element);
      } else {
        folderList.add(element);
      }
    });
    notifyListeners();
  }

  void listContentData() async {
    final listContentData = await ApiService().fetchListContent();
    finalListContentData = listContentData;
    notifyListeners();
  }

  /// UserDetailProvider
  UserdetailsModel userdetailsModel = UserdetailsModel();

  UserdetailsModel? get details => userdetailsModel;

  Future<void> fetchUserDetails() async {
    userdetailsModel = await ApiService().serviceUserDetails();
    notifyListeners();
  }

  signInDispose() {
    emailController2.clear();
    passwordController2.clear();
    // notifyListeners();
  }

  signUpDispose() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    // notifyListeners();
  }

  ///For the CreateNewFolder
  final TextEditingController createfoldertext = TextEditingController();

  Future<void> createnewFolder(BuildContext context) async {
    createFolderLoading = true;
    notifyListeners();
    ApiService().newFolder(
      foldername: createfoldertext.text,
      destinationFolderId: ffetchDataafterLogin.currentParent ?? -1,
      onSuccess: (value) {
        print("folder create succesfully");
        createfoldertext.clear();
        createFolderLoading = false;
        fetchDataaafterLogin();
        // notifyListeners();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
        notifyListeners();
      },
      onError: (value) async {
        createFolderLoading = false;
        notifyListeners();
      },
    );
  }

  /// for deleteFolder
  Future<void> deleteFolder({
    required BuildContext context,
    List<int>? fileId,
    List<int>? folderId,
  }) async {
    deleteLoading = true;
    notifyListeners();
    ApiService().removeFolder(
      files: fileId,
      folders: folderId,
      onSuccess: (value) {
        deleteLoading = false;
        // fileList.removeWhere((element) => element.contentId == fileId);
        // folderList.removeWhere((element) => element.contentId == fileId);
        fetchDataaafterLogin();
        notifyListeners();
      },
      onError: (value) async {
        deleteLoading = false;
        notifyListeners();
      },
    );
  }

  /// CollaborateChat
  CollaborateModel collaborateData = CollaborateModel();
  Map<String, dynamic> fetchedCollaborateData = {};

  Future<void> collaborateModelProvider() async {
    // collaborateData = await ApiService().CollaborateDetailsChat();
    fetchedCollaborateData = await ApiService().collaborateDetailsChat();
    // print(fetchedCollaborateData);
    notifyListeners();
  }

  /// ChatPage
  ChatPageData chatPage = ChatPageData();

  Future<void> chatPageProvider(Map<String,dynamic> userItemData) async {
    chatPage = await ApiService().chatPageDetails(userItemData: userItemData);
    print(chatPage);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhh----------------------------------------------------eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
  }

  /// GlobalSearch
  GlobalSearch globalSearch = GlobalSearch();

  Future<void> globalSearchProvider() async {
    globalSearch = (await ApiService().globalSearch())!;
  }
}

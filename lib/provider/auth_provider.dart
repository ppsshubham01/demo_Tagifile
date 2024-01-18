import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tagifiles/model/user_data.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';
import 'package:tagifiles/screens/home/home_screen.dart';
import 'package:tagifiles/services/service.dart';

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

  /// forgotPassword Emailtext
  final TextEditingController forgorPasswordText = TextEditingController();



  /// for focusIcon
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isSelected = true;

  /// for the fetchingData
  Model ffetchDataafterLogin= Model();
  var finalListContentData;


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
      onError: (value) async{
        await Fluttertoast.showToast(msg: 'SignUp email should be used!', toastLength: Toast.LENGTH_SHORT );
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
      onError: (value) async{
      await Fluttertoast.showToast(msg: 'LogIn password/email is wrong!', toastLength: Toast.LENGTH_SHORT );
      },
    );
  }


  void forgotPassword(BuildContext context){

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
    ApiService().forgotPassword(
        forgotPasswordEmailPhone: forgorPasswordText.text);
  }


  void fetchDataaafterLogin() async {
    final fetchedDataAfterLogin = await ApiService().fetchDataAfterLogin();
    ffetchDataafterLogin= fetchedDataAfterLogin;
    notifyListeners();
  }

  void listContentData() async{
    final listContentData = await ApiService().fetchListContent();
    finalListContentData = listContentData;
    notifyListeners();
  }


}

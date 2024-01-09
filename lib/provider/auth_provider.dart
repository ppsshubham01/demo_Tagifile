import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';
import 'package:tagifiles/screens/home/home_screen.dart';
import 'package:tagifiles/screens/verification/email_pending.dart';
import 'package:tagifiles/util/service.dart';

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
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
      },
      onError: (value) async{
        await Fluttertoast.showToast(msg: 'Something went wrong!', toastLength: Toast.LENGTH_SHORT );
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
      await Fluttertoast.showToast(msg: 'Something went wrong!', toastLength: Toast.LENGTH_SHORT );

    },
    );
  }

  ///
}

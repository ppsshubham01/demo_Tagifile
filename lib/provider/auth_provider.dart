import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  /// for signUp method
  void signUpUser(BuildContext context) {
    ApiService().signup(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      onSuccess: (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
      },
    );
  }

  /// for signIn method
  void signInUser(BuildContext context) {
    ApiService().login(
      email: emailController2.text,
      password: passwordController2.text,
      context: context,
      onSuccess: (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      },
    );
  }

  ///
}

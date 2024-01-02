import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagifiles/screens/home_screen.dart';
import 'package:tagifiles/screens/verification/email_pending.dart';
import 'package:tagifiles/screens/welcome_screen.dart';
import 'package:tagifiles/util/service.dart';

class AuthProvider with ChangeNotifier {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

void signUpUser(BuildContext context){
  ApiService().signup(
    firstName: firstNameController.text,
    lastName: lastNameController.text,
    email: emailController.text,
    password: passwordController.text,
    onSuccess: (value) {
      Navigator.push(context, MaterialPageRoute(
          builder: (_) => const WelcomeScreen()));
    },
  );
}



}
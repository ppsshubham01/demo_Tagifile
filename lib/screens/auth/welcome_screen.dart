import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/home/home_screen.dart';
import 'package:tagifiles/screens/auth/signup_screen.dart';
import 'package:tagifiles/screens/verification/fogot_password.dart';
import 'package:tagifiles/util/service.dart';
import 'package:tagifiles/util/validation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isSelected = true;
  // TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  // final serviceObject = ApiService();

  void _onEmailTap() {
    setState(() {
      _emailFocusNode.requestFocus();
    });
  }

  void _onPasswordTap() {
    setState(() {
      _passwordFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// creating provider instance
    final authProviderInstance = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              height: 900,
              child: Stack(
                children: [
                  /// Background ImageBottom
                  Container(
                      color: const Color(0xFF1D55A4),
                      child: Image.asset("images/cityskyline.png",
                          height: 180)),

                  Positioned(
                    top: 160,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /// Welcome Text
                          const Padding(
                            padding: EdgeInsets.only(left: 25, top: 50),
                            child: Text(
                              'Welcome to Tagifiles',
                              style: TextStyle(
                                color: Color(0xFF414141),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              'Login to Your Account',
                              style: TextStyle(
                                color: Color(0xFF7A7A7A),
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          /// Email
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 40, right: 20),
                            child: TextFormField(
                              autofocus: true,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: authProviderInstance.emailController2,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: const TextStyle(
                                  color: Color(0xFF414141),
                                ),
                                hintText: 'Enter your email address',
                                prefixIcon: Icon(Icons.email,
                                    color: _emailFocusNode.hasFocus
                                        ? const Color(0xFF1672F3)
                                        : const Color(0xFF7A7A7A)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF1D55A4),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 50),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Color(0xFF1D55A4)),
                                ),
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: _emailFocusNode,
                              onTap: _onEmailTap,
                              // onTap: authProviderInstance.focusEmailTap(),
                              validator: (value) {
                                return Validation.emailValidate(value);
                                // final RegExp emailRegex = RegExp(
                                //     r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                // bool validateEmail(String email) {
                                //   return emailRegex.hasMatch(email);
                                // }
                                //
                                // if (value!.isEmpty) {
                                //   return 'Please enter the email';
                                // } else if (!validateEmail(value)) {
                                //   //print('Enter valid E-mail');
                                //   return 'Enter valid E-mail';
                                // }
                              },
                            ),
                          ),

                          /// Password
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: TextFormField(
                              // autofocus: true,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller:
                                  authProviderInstance.passwordController2,
                              obscureText: _isSelected,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Color(0xFF414141)),
                                hintText: 'Enter your Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: _passwordFocusNode.hasFocus
                                      ? const Color(0xFF1672F3)
                                      : const Color(0xFF7A7A7A),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isSelected = !_isSelected;
                                    });
                                  },
                                  child: Icon(_isSelected ? Icons.visibility_off : Icons.visibility),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF1D55A4),
                                    )),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 50),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Color(0xFF1D55A4)),
                                ),
                              ),
                              focusNode: _passwordFocusNode,
                              onTap: _onPasswordTap,
                              validator: (value) {
                                return Validation.passwordValidate(value);
                                // if (value!.isEmpty) {
                                //   return "Password is required";
                                // } else if (value.length < 8) {
                                //   return ('length should be at-least 8 character');
                                // } else if(!value.contains(RegExp(r'[A-Z]'))){
                                //   return "Password not contain at-least one capital letter";
                                // } else if(!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))){
                                //   return "Password not contain at-least one special character";
                                // }
                              },
                            ),
                          ),

                          /// remember me & Forgot
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    // Checkbox(value: false, onChanged: (value) {}),
                                    // const Text(
                                    //   'Remember Me',
                                    //   style: TextStyle(color: Color(0xFF7A7A7A)),
                                    // ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const ForgotPassword()));
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Color(0xFF7A7A7A)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          authProviderInstance.loginLoading ?
                          // buildCustomProgressIndicator()
                          const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Color(0xFF1D55A4),
                            ),
                          )
                              : SizedBox(),
                          /// LogIn Buttom
                          // authProviderInstance.loginLoading ? const CircularProgressIndicator(
                          //   color: Color(0xFF1D55A4),
                          // ) :0
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()));
                                if (formKey.currentState!.validate()) {
                                  // serviceObject.login(
                                  //   email: emailController.text,
                                  //   password: passwordController.text,
                                  //   onSuccess: (value) {
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (_) => const HomePage()));
                                  //   },
                                  //   context: context,
                                  // );
                                  authProviderInstance.signInUser(context);
                                  print("Validated");
                                } else {
                                   const SnackBar(
                                    content: Text(
                                      "Error....",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    backgroundColor: Colors.redAccent,
                                  );
                                  // print("Not Validated");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color((0xFF1D55A4)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                fixedSize: const Size(347, 45),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),

                          /// Text or sign in with
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 40),
                            child: const Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    // height: 1.0,
                                  ),
                                ),
                                Text(
                                  "  or Sign in with  ",
                                  style: TextStyle(color: Color(0xFF7A7A7A)),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    // height: 1.0,
                                  ),
                                )
                              ],
                            ),
                          ),

                          ///  Logo Google Signin
                          Padding(
                            padding: const EdgeInsets.only(top: 45, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "images/Apple.svg",
                                    width: 58,
                                    height: 58,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "images/google.svg",
                                    width: 58,
                                    height: 58,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "images/Facebook.svg",
                                    width: 58,
                                    height: 58,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// text for going signUpPage
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Text("Don't have an account?"),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignupScreen()));
                                  },
                                  child: const Text(
                                    "Create an Account",
                                    style: TextStyle(
                                        color: Color(0xFF1672F3),
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomProgressIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Color(0xFF1672F3),
              strokeWidth: 8,
            ),
          ),
        ),
      ),
    );
  }
}

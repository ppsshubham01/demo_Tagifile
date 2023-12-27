import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tagifiles/screens/welcome_screen.dart';
import 'package:tagifiles/util/service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int _selectedOption = 1;
  bool _isSelected = true;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
              // resizeToAvoidBottomInset: false,
              children: <Widget>[
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Image.asset("images/bottombackground.png")),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Welcome Text
                    const Padding(
                      padding: EdgeInsets.only(left: 25, top: 80),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color(0xFF414141),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sign up to Contiune',
                            style: TextStyle(
                              color: Color(0xFF7A7A7A),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// firstLastName-email-pass
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 40, right: 20),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          labelText: 'FirstName',
                          labelStyle: const TextStyle(
                            color: Color(0xFF414141),
                          ),
                          hintText: 'Enter your firstname',
                          prefixIcon: const Icon(Icons.person,
                              color: Color(0xFF1672F3)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0x1D55A4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF1D55A4)),
                          ),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter firstName';
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          labelText: 'LastName',
                          labelStyle: const TextStyle(
                            color: Color(0xFF414141),
                          ),
                          hintText: 'Enter your lastname',
                          prefixIcon: const Icon(Icons.person,
                              color: Color(0xFF1672F3)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0x1D55A4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF1D55A4)),
                          ),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter lastName";
                          }
                        },
                      ),
                    ),

                    // const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Gender: ",
                            style: TextStyle(
                                color: Color(0xFF414141), fontSize: 18),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              const Text('Male'),
                              Radio<int>(
                                value: 1,
                                groupValue: _selectedOption,
                                activeColor: Colors.blueAccent,
                                // fillColor: MaterialStateProperty.all(Colors.red),
                                splashRadius: 20,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Female'),
                              Radio<int>(
                                value: 2,
                                groupValue: _selectedOption,
                                activeColor: Colors.blueAccent,
                                // fillColor: MaterialStateProperty.all(Colors.blue),
                                splashRadius: 25,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedOption = value!;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 5, right: 20),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Color(0xFF414141),
                          ),
                          hintText: 'Enter your email address',
                          prefixIcon:
                              const Icon(Icons.email, color: Color(0xFF1672F3)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0x1D55A4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF1D55A4)),
                          ),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          final RegExp emailRegex = RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                          bool validateEmail(String email) {
                            return emailRegex.hasMatch(email);
                          }

                          if (value!.isEmpty) {
                            return 'Please enter the email';
                          } else if (!validateEmail(value)) {
                            //print('Enter valid E-mail');
                            return 'Enter valid E-mail';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _passwordController,
                        obscureText: _isSelected,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color(0xFF414141),
                          ),
                          hintText: 'Enter your password',
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFF1672F3)),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _isSelected = !_isSelected;
                              });
                            },
                            child: Icon(_isSelected
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0x1D55A4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF1D55A4)),
                          ),
                        ),
                        maxLines: 1,
                        // keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          } else if (value.length < 8) {
                            return ('length should be at-least 8 character');
                          } else if(!value.contains(RegExp(r'[A-Z]'))){
                            return "Password not contain at-least one capital letter";
                          } else if(!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))){
                            return "Password not contain at-least one special character";
                          }
                        },
                      ),
                    ),

                    /// signUpButton
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ApiService().signup(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              onSuccess: (value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const WelcomeScreen()));
                              },
                            );
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => HomePage()));
                            // print("Validated");
                          } else {
                            // print("Not Validated");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color((0xFF1D55A4)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            fixedSize: const Size(347, 35)),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 2,
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
                              thickness: 2,
                              // height: 1.0,
                            ),
                          )
                        ],
                      ),
                    ),

                    /// Google login
                    Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                        )),

                    /// Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Already have a account?"),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WelcomeScreen()));
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  color: Color(0xFF1672F3),
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
              ]),
        ),
      )),
    );
  }
}

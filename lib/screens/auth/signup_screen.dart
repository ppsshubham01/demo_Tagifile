import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';
import 'package:tagifiles/util/validation.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int _selectedOption = 1;
  bool _isSelected = true;

  final FocusNode _emailFocusNode= FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _firstnameFocusNode= FocusNode();
  final FocusNode _lastnameFocusNode= FocusNode();

  void _onEmailTap(){
    setState(() {
      _emailFocusNode.requestFocus();
    });
  }
  void _onPasswordTap(){
    setState(() {
      _passwordFocus.requestFocus();
    });
  }
  void _onFirstnameTap(){
    setState(() {
      _firstnameFocusNode.requestFocus();
    });
  }
  void _onLastnameTap(){
    setState(() {
      _lastnameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Provider.of<AuthProvider>(context,listen: false).signUpDispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final authProviderInstance = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SizedBox(
            height: 1000,
            child: Stack(
                // resizeToAvoidBottomInset: false,
                children: <Widget>[
                  /// Background ImageBottom
                  Container(
                      color: const Color(0xFF1D55A4),
                      child: Image.asset("images/cityskyline.png",
                          height: 180)),

                  Positioned(
                    top: 160,
                    left: 0,
                    right: 0,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Color(0xFF414141),
                                    fontSize: 22.0,
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

                          /// firstName
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, top: 40, right: 20),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: authProviderInstance.firstNameController,
                              decoration: InputDecoration(
                                labelText: 'FirstName',
                                labelStyle: const TextStyle(
                                  color: Color(0xFF414141),
                                ),
                                hintText: 'Enter your firstname',
                                prefixIcon:  Icon(Icons.person,
                                    color: _firstnameFocusNode.hasFocus ? const Color(0xFF1672F3) : const Color(0xFF7A7A7A)),
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
                              focusNode: _firstnameFocusNode,
                              onTap: _onFirstnameTap,
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter firstName';
                                }
                              },
                            ),
                          ),

                          ///LastName
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: authProviderInstance.lastNameController,
                              decoration: InputDecoration(
                                labelText: 'LastName',
                                labelStyle: const TextStyle(
                                  color: Color(0xFF414141),
                                ),
                                hintText: 'Enter your lastname',
                                prefixIcon: Icon(Icons.person,
                                    color: _lastnameFocusNode.hasFocus?  const Color(0xFF1672F3) : const Color(0xFF7A7A7A)),
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
                              focusNode: _lastnameFocusNode,
                              onTap: _onLastnameTap,
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter lastName";
                                }
                              },
                            ),
                          ),

                          ///Gender
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

                          ///Email
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, top: 5, right: 20),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: authProviderInstance.emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: const TextStyle(
                                  color: Color(0xFF414141),
                                ),
                                hintText: 'Enter your email address',
                                prefixIcon:
                                     Icon(Icons.email,
                                        color: _emailFocusNode.hasFocus?  const Color(0xFF1672F3) : const Color(0xFF7A7A7A)),
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
                              focusNode: _emailFocusNode,
                              onTap: _onEmailTap,
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
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
                               return Validation.emailValidate(value);
                              },
                            ),
                          ),

                          ///Password
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: authProviderInstance.passwordController,
                              obscureText: _isSelected,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  color: Color(0xFF414141),
                                ),
                                hintText: 'Enter your password',
                                prefixIcon:
                                     Icon(Icons.lock, color: _passwordFocus.hasFocus
                                        ? const Color(0xFF1672F3)
                                        : const Color(0xFF7A7A7A)),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _onPasswordTap();
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
                              focusNode: _passwordFocus,
                              onTap: _onPasswordTap,
                              maxLines: 1,
                              // keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                return Validation.passwordValidate(value);
                              },
                            ),
                          ),


                          /// signUpButton
                          authProviderInstance.signUpLoading ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Color(0xFF1D55A4),
                            ),
                          ): const SizedBox.shrink(),

                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  authProviderInstance.signUpUser(context);
                                  // print("Validated");
                                }
                                // else {
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (_) => const EmailPending()));
                                  // print("Not Validated");
                                // }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color((0xFF1D55A4)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  fixedSize: const Size(347, 45)),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white, fontSize: 14.0),
                              ),
                            ),
                          ),

                          ///orSign in with
                          Container(
                            margin:
                                const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                    ),
                  ),
                ]),
          ),
        ),
      )),
    );
  }
}

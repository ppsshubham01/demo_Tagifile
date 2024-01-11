import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagifiles/provider/auth_provider.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
  final authProviderInstance = Provider.of<AuthProvider>(context);
    return  SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0XffF5F6F9),
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(25),
              height: 400,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phonelink_erase_rounded,color: Colors.blue,size: 50,),
                  const SizedBox(height: 30,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        children: [
                          TextSpan(text: 'Forgot Password\n',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18), ),
                          TextSpan(text: 'Enter Your email or phone number,we will send you a \n', style: TextStyle(color: Colors.black),),
                          TextSpan(text: 'link to get back into your account', style: TextStyle(color: Colors.black),),
                        ]
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 11.0, bottom: 5),
                          child: Text("Email"),
                        ),
                        TextFormField(
                          controller: authProviderInstance.forgorPasswordText,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Enter your email address or mobile number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color(0xFF1D55A4),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                const BorderSide(color: Color(0xFF1D55A4)),
                              ),
                            ),
                            onTap: () {}
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left:20,right: 20),
                    width: double.infinity,
                    child: TextButton(onPressed: (){
                      authProviderInstance.forgotPassword(context);
                    },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF1D55A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ), child: const Text('Reset Password', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_back),
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const WelcomeScreen())),
                        // Close bottom sheet
                        child: const Text(
                          'Back to LogIn',
                          style: TextStyle(color: Color(0xFF7A7A7A)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

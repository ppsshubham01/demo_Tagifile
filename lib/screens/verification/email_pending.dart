import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagifiles/screens/auth/welcome_screen.dart';
import 'package:tagifiles/screens/verification/email_verify.dart';
import 'package:tagifiles/screens/verification/two_factor_auth.dart';

class EmailPending extends StatelessWidget {
  const EmailPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF5F6F9),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(25),
          height: 350,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.email_outlined,
                color: Colors.blue,
                size: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Email Verification Pending\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextSpan(
                    text: 'We have Sent You Email Verification link on\n',
                    style: TextStyle(color: Color(0xFF7A7A7A)),
                  ),
                  TextSpan(
                    text: 'abc@gmail.com\n',
                    style: TextStyle(
                        color: Color(0xFF414141),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                // width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const TwoFactorAuth()));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF1D55A4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the radius as needed
                          ),
                        ),
                        child: const Text(
                          'Resend Link',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Link Sent Successfully.',
                      style: TextStyle(color: Color(0xFF00A150)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF707070),
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WelcomeScreen(),
                            ),
                          ),
                      // onTap: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen())),
                      child: const Text(
                        'Back to Login',
                        style: TextStyle(color: Color(0xFF414141)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

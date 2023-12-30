import 'package:flutter/material.dart';

class EmailVerify extends StatelessWidget {
  const EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF5F6F9),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(25),
          height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.verified,color: Colors.blue,size: 50,),
              const SizedBox(height: 30,),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    children: [
                      TextSpan(text: 'Email Verification Successfully\n',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18), ),
                      TextSpan(text: 'Your Email has been Successfully Verified click\n', style: TextStyle(color: Colors.black),),
                      TextSpan(text: 'below to Log in Manually', style: TextStyle(color: Colors.black),),
                    ]
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.only(left:20,right: 20),
                width: double.infinity,
                child: TextButton(onPressed: (){},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1D55A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ), child: const Text('Log In', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

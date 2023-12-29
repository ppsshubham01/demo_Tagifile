import 'package:flutter/material.dart';
import 'package:tagifiles/screens/verification/email_verify.dart';
import 'package:tagifiles/screens/verification/two_factor_auth.dart';

class EmailPending extends StatelessWidget {
  const EmailPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          height: 350,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.mail,color: Colors.blue,size: 50,),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                children: [
                  TextSpan(text: 'Email Verification Pending\n',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18), ),
                  TextSpan(text: 'We have Sent You Email Verification link on\n', style: TextStyle(color: Colors.black),),
                  TextSpan(text: 'abc@gmail.com\n', style: TextStyle(color: Colors.black,fontSize: 18),),
                ]
              ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20,right: 20),
                // width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TwoFactorAuth()));
                      }, child: Text('Resend Link', style: TextStyle(color: Colors.white),),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                        ),
                      ),
                      ),
                    ),
                    Text('Link Sent Successfully.',style: TextStyle(color: Colors.green),),
                  ],
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  Text('Back to Login')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EmailVerify extends StatelessWidget {
  const EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          height: 300,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.done,color: Colors.blue,size: 50,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Email Verification Successfully\n',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18), ),
                      TextSpan(text: 'Your Email has been Successfully Verified click\n', style: TextStyle(color: Colors.black),),
                      TextSpan(text: 'below to Log in Manually', style: TextStyle(color: Colors.black),),
                    ]
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:20,right: 20),
                width: double.infinity,
                child: TextButton(onPressed: (){}, child: Text('Log In', style: TextStyle(color: Colors.white),),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

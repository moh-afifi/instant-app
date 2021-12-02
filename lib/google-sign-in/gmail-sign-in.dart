import 'package:cv/google-sign-in/google.dart';
import 'package:cv/google-sign-in/welcome_page.dart';
import 'package:flutter/material.dart';

class GmailSignIn extends StatefulWidget {
  @override
  _GmailSignInState createState() => _GmailSignInState();
}

class _GmailSignInState extends State<GmailSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign-in'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('gmail-sign-in'),
          color: Colors.teal,
          padding: EdgeInsets.all(20),
          onPressed: (){
            signInWithGoogle().then((result) {
              if (result != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              }
            });

          },
        ),
      ),
    );
  }
}

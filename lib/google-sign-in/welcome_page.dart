import 'package:flutter/material.dart';
import 'google.dart';
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              onPressed: () async{
                await signOutGoogle();
                Navigator.pop(context);
              },
              child: Text('sign out'),
            ),
            Text('welcome page'),
          ],
        ),
      ),
    );
  }
}

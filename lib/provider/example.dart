import 'package:cv/provider/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelProvider>(
      create: (context) => ModelProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageOne(
            // appBarText: 'hi from page one',
            // bodyText: 'hi body from page one',
            ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  // PageOne({this.appBarText, this.bodyText});
  //
  // final String appBarText, bodyText;

  @override
  Widget build(BuildContext context) {
    return PageTwo(
        // appBarText: appBarText,
        // bodyText: bodyText,
        );
  }
}

class PageTwo extends StatelessWidget {
  // PageTwo({this.appBarText, this.bodyText});
  //
  // final String appBarText, bodyText;

  @override
  Widget build(BuildContext context) {
    return PageThree(
        // appBarText: appBarText,
        // bodyText: bodyText,
        );
  }
}

class PageThree extends StatelessWidget {
  // PageThree({this.appBarText, this.bodyText});
  //
  // final String appBarText, bodyText;

  @override
  Widget build(BuildContext context) {
    return PageFour(
        // bodyText: bodyText,
        // appBarText: appBarText,
        );
  }
}

class PageFour extends StatelessWidget {
  // PageFour({this.appBarText, this.bodyText});
  //
  // final String appBarText, bodyText;

  @override
  Widget build(BuildContext context) {
    return PageFive(
        // appBarText: appBarText,
        // bodyText: bodyText,
        );
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('check performance');
    return Scaffold(
      appBar: AppBar(
        title: Text('page Five'),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<ModelProvider>(
                builder: (context, myProviderChange, child) {
              return TextField(
                onChanged: (val) {
                  myProviderChange.changeText(val);
                },
              );
            }),
            Consumer<ModelProvider>(
              builder: (context, myProvider, child) {
                return Text(myProvider.bodyText);
              },
            )
          ],
        ),
      )),
    );
  }
}

import 'file:///C:/flutterProjects/projects/itSharks/cv/lib/state_management/model/counter_logic.dart';
import 'file:///C:/flutterProjects/projects/itSharks/cv/lib/state_management/model/text_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Consumer<TextLogic>(
            builder: (context, textProvider, child) {
              return Text(
                textProvider.text,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              );
            },
          )),
      floatingActionButton: Consumer<CounterLogic>(
        builder: (context, buttonProvider, child) {
          return FloatingActionButton(
            onPressed: () {
              buttonProvider.increment();
            },
            backgroundColor: Colors.pink,
            elevation: 10,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          );
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<TextLogic>(
                  builder: (context, textFieldProvider, child) {
                    return TextField(
                      onChanged: (val) {
                        textFieldProvider.changeText(val);
                      },
                      decoration: InputDecoration(
                          hintText: 'enter text..',
                          labelText: 'text',
                          border: OutlineInputBorder()),
                    );
                  },
                )),
            Consumer2<CounterLogic, TextLogic>(
              builder: (context, counterProvider, textProvider, child) {
                return Column(
                  children: [
                    Text(
                      textProvider.text,
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      '${counterProvider.counter}',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


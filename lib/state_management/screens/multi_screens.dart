import 'package:cv/state_management/model/counter_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var myProvider= Provider.of<CounterLogic>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('screen one'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<CounterLogic>(
              builder: (context, counterProvider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        counterProvider.increment();
                      },
                    ),
                    Text(counterProvider.counter.toString()),
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 40,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        counterProvider.decrement();
                      },
                    ),
                  ],
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenTwo(),
                  ),
                );
              },
              child: Text(
                'screen one',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen two'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenThree(),
              ),
            );
          },
          child: Text(
            'screen two',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen three'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenFour(),
              ),
            );
          },
          child: Text(
            'screen three',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen four'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(''),
            TextButton(
              onPressed: () {},
              child: Text(
                'screen four',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

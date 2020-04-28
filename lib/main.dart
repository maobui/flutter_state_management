import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InheritedCounter(child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        int counter = InheritedCounter.of(context).counter;
        Function increment = InheritedCounter.of(context).increment;

        return Scaffold(
          appBar: AppBar(
            title: Text("Hello "),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() => increment()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }

}

class InheritedCounter extends InheritedWidget {
  final Map _counter = { 'val': 0};
  final Widget child;

  InheritedCounter({this.child}): super(child: child);

  increment() {
    _counter['val'] ++;
  }

  get counter => _counter['val'];

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedCounter of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedCounter>();

}

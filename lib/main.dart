import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_persist/counter_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CounterStore.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _keyCounter = 'counter';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('$_counter before retrieval');
    retrieveCounter();
    print(_counter);
  }

  void storeCounter() {
    CounterStore.storeCounter(_counter);
    print('$_counter stored');
  }

  void retrieveCounter() {
    _counter = CounterStore.retrieveCounter();
    print('$_counter in retrieve counter');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    storeCounter();
  }

  @override
  Widget build(BuildContext context) {
    print('in Build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

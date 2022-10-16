import 'dart:async';

import 'package:flutter/material.dart';

import 'sayac_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Stream Bloc Pattern'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final SayacViewModel sayacViewModel = SayacViewModel();

  @override
  Widget build(BuildContext context) {
    print("Build Run");
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          initialData: sayacViewModel.init() ,
          builder: (context, snapshot) => Text(title + ' ${snapshot.data}'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              initialData: sayacViewModel.init(),
              stream: sayacViewModel.sayacStream,
              builder: (context, snapshot) => Text(
                snapshot.hasData
                    ? snapshot.data.toString()
                    : 'Değer Bulunamadı.',
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              sayacViewModel.arttir();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              sayacViewModel.azalt();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}

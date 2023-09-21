import 'package:bloc_consumer_test/bloc/simple_bloc.dart';
import 'package:bloc_consumer_test/when_listen_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SimpleBloc simpleBloc = SimpleBloc();
  String title = 'Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WhenListenWidget(
              simpleBloc: simpleBloc,
              onListenerA: (data) {
                setState(() {
                  title = data;
                });
              },
              onListenerB: (data) {
                setState(() {
                  title = data;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

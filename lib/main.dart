import 'package:flutter/material.dart';
import 'package:flutter_rxdart_app/movie_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieList(),
    );
  }
}

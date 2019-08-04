import 'package:flutter/material.dart';
import 'package:reel_nepal/pages/home_page.dart';

import '../singletons.dart';

void main() {
  Singletons.register();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reel Nepal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

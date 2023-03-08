import 'package:flutter/material.dart';
import 'package:fproject/%EC%8A%A4%ED%81%AC%EB%A6%B02/homescreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescreen(),
    );
  }
}

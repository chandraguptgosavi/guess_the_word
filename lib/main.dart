import 'package:flutter/material.dart';
import 'package:guess_the_word/screens/title/title_screen.dart';
import 'package:guess_the_word/values/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.title,
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TitlePage(),
    );
  }
}

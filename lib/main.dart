import 'package:flutter/material.dart';
import 'package:open_trivia/ui/pages/intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: 'Open Trivia',
      theme: ThemeData
      (
        primarySwatch: Colors.green,
        fontFamily: "Montserrat",
        buttonTheme: ButtonThemeData
        (
          shape: RoundedRectangleBorder
          (
            borderRadius: BorderRadius.circular(20.0),
          ),

          textTheme: ButtonTextTheme.primary
        )
      ),

      home: IntroSliderPage(),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_trivia/ui/pages/intro.dart';
// import 'package:open_trivia/ui/pages/splash.dart';

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

      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget
{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    super.initState();
    Timer(const Duration(seconds: 3), () 
    {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => IntroSliderPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff393d4e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Image.asset('assets/images/otdb.png', height: 200)
          ],
        ),
      ),
    );
  }
}


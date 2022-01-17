// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:open_trivia/ui/pages/intro.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData
//       (
//         primarySwatch: Colors.green,
//         fontFamily: "Montserrat",
//         buttonTheme: ButtonThemeData
//         (
//           shape: RoundedRectangleBorder
//           (
//             borderRadius: BorderRadius.circular(20.0),
//           ),

//           textTheme: ButtonTextTheme.primary
//         )
//       ),
//       debugShowCheckedModeBanner: false,
//         title: 'Open Trivia',
//         home: AnimatedSplashScreen(
//           duration: 4000,
//           splash: 'assets/images/otdb.png',
//           nextScreen: IntroSliderPage(),
//           splashTransition: SplashTransition.fadeTransition,
//           //pageTransitionType: PageTransitionType.scale,
//           backgroundColor: const Color(0xff393d4e)
//         )
//     );
//   }
// }

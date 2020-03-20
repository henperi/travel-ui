import 'package:flutter/material.dart';
import 'package:travel_ui/screens/home_screen.dart';
import 'package:travel_ui/styles/colors.styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel UI',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        scaffoldBackgroundColor: scaffoldBgColor,
      ),
      home: HomeScreen(),
    );
  }
}

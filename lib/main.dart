import 'package:flutter/material.dart';
import 'package:my_contact_appz/Screens/loginPage.dart';
import 'package:my_contact_appz/Screens/splash.dart';

const saveKeyName = 'userLoggedIn';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Contact App",
      home: ScreenSplash(),
    );
  }
}

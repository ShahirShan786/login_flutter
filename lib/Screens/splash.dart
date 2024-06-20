import 'package:flutter/material.dart';
import 'package:my_contact_appz/Screens/homePage.dart';
import 'package:my_contact_appz/Screens/loginPage.dart';
import 'package:my_contact_appz/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

@override
void initState(){
    CheckUserLogIn(context); 
    super.initState();
}


void didChangeDepencies(){
  super.didChangeDependencies();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Text(
                "My Book",
                style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w900,
                    fontFamily: "OleoScript font"),
              ),
              Text(
                "Lets connect with our people",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Serif font",
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }

  // splash Fuction
  Future<void> gotoLoginPage(context) async {
    await Future.delayed(const Duration(
      seconds: 3,
    ));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

//  Login check fuction
  Future<void> CheckUserLogIn(context1) async {
    final SharedPrefs = await SharedPreferences.getInstance();

    final UserLogIn = SharedPrefs.getBool(saveKeyName);

    if (UserLogIn == null || UserLogIn == false) {
      gotoLoginPage(context1);
    } else {
      Navigator.of(context1).pushReplacement(
        MaterialPageRoute(
          builder: (context1) => HomePAge(),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:my_contact_appz/Screens/homePage.dart';
import 'package:my_contact_appz/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Login with your username and password",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 244, 242, 242),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration.collapsed(
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    fontFamily: "Roboto font",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16)),
                            validator: (value) => value == null || value.isEmpty
                                ? 'UserNAme is Empty'
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 244, 242, 242),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration.collapsed(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontFamily: "Roboto font",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Password is Empty'
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 5, 2, 39)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        fixedSize:
                            MaterialStateProperty.all(const Size(210, 60)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25))))),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        checkLogin(context);
                      }
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Roboto font",
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    //Condition Check
    if (username == 'shahir' && password == "1998") {
      // Go to Home
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(saveKeyName, true);
      correct(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context1) => const HomePAge()),
      );
    }else{
      if(username.isNotEmpty){
        incurrect(context);
      }
    }
  }

// if Currect
  void correct(context) {
    const currectMessage = 'Username password matched';
    // snack bar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        margin: EdgeInsets.all(10),
        content: Text(currectMessage),
      ),
    );
  }

// if incurrect

  void incurrect(context1) {
    const incorrectMassage = "Username and password not matched";
    // snack bar
    ScaffoldMessenger.of(context1).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        content: Text(incorrectMassage),
      ),
    );
  }
}

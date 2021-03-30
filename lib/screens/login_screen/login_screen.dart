import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:plants_shop/screens/home_screen/home_screen.dart';
import 'package:plants_shop/screens/signup_screen/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            // overflow: Overflow.visible,
            children: [
              Positioned(
                top: 0,
                child: buildBanner(context),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.59,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFCC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditTextLogIn(
                        controller: _userNameController,
                        hint: "usename",
                        icon: Icon(Icons.person_outline),
                      ),
                      SizedBox(height: 20),
                      EditTextLogIn(
                        controller: _passwordController,
                        hint: "password",
                        icon: Icon(Icons.lock_outline),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "forgot password ?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.balooBhaijaan(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await _firebaseAuth
                              .signInWithEmailAndPassword(
                                  email: _userNameController.text,
                                  password: _passwordController.text)
                              .then((value) => print('Login Successfully'));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            primary: Colors.white,
                            backgroundColor: Colors.green[900]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        child: Container(
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.balooBhaijaan(
                              fontSize: 18,
                              color: Colors.green[900],
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// banner login
  Container buildBanner(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/banner_login.jpg",
            height: MediaQuery.of(context).size.width / 1.40,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 70),
            child: Text(
              "Plant Shop".toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantUpright(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.green[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditTextLogIn extends StatelessWidget {
  const EditTextLogIn({
    Key key,
    @required this.controller,
    this.icon,
    this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final Icon icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

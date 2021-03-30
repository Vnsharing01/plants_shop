import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  //
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _eMailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/images/banner_signup.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 60),
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cormorantUpright(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.4,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 55,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFCC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      EditTextSignUp(
                        controller: _eMailController,
                        hint: "Email",
                        icon: Icon(Icons.mail_outline),
                      ),
                      SizedBox(height: 10),
                      EditTextSignUp(
                        controller: _userNameController,
                        hint: "UserName",
                        icon: Icon(Icons.person_outline),
                      ),
                      SizedBox(height: 10),
                      EditTextSignUp(
                        controller: _passwordController,
                        hint: "Password",
                        icon: Icon(Icons.lock_outline),
                      ),
                      SizedBox(height: 10),
                      EditTextSignUp(
                        controller: _phoneNumberController,
                        hint: "PhoneNumber",
                        icon: Icon(Icons.phone_android_rounded),
                      ),
                      SizedBox(height: 40),
                      TextButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.baloo(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await _firebaseAuth.createUserWithEmailAndPassword(
                              email: _eMailController.text,
                              password: _passwordController.text);
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            primary: Colors.white,
                            backgroundColor: Colors.green[900]),
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
}

class EditTextSignUp extends StatelessWidget {
  const EditTextSignUp({
    Key key,
    @required this.controller,
    this.hint,
    this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

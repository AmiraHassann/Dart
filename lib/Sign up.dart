import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController usernameFieldController = TextEditingController();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final TextEditingController confirmPasswordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final scaleFactor = (screenWidth / 375 + screenHeight / 812) / 2;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF034985),
        appBar: _buildAppBar(scaleFactor),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 60 * scaleFactor),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40 * scaleFactor, vertical: 74 * scaleFactor),
                decoration: BoxDecoration(
                  color: const Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(24 * scaleFactor),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUsernameField(scaleFactor),
                    SizedBox(height: 20 * scaleFactor),
                    _buildEmailField(scaleFactor),
                    SizedBox(height: 20 * scaleFactor),
                    _buildPasswordField(scaleFactor),
                    SizedBox(height: 20 * scaleFactor),
                    _buildConfirmPasswordField(scaleFactor),
                    SizedBox(height: 40 * scaleFactor),
                    _buildSignUpButton(scaleFactor),
                    SizedBox(height: 48 * scaleFactor),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(double scaleFactor) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 98 * scaleFactor,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 48 * scaleFactor,
      leading: Padding(
        padding: EdgeInsets.only(left: 16 * scaleFactor, top: 24 * scaleFactor, bottom: 27 * scaleFactor),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24 * scaleFactor,
        ),
      ),
      centerTitle: true,
      title: Text(
        "Sign Up",
        style: TextStyle(
          color: const Color(0XFFFFFFFF),
          fontSize: 34.33 * scaleFactor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildUsernameField(double scaleFactor) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: usernameFieldController,
        style: TextStyle(
          color: const Color(0X7F000000),
          fontSize: 18 * scaleFactor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person, color: Color(0XFF034985)),
          hintText: "Username",
          hintStyle: TextStyle(
            color: const Color(0X7F000000),
            fontSize: 18 * scaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          filled: true,
          fillColor: const Color(0XFFFFFFFF),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 18 * scaleFactor, vertical: 18 * scaleFactor),
        ),
      ),
    );
  }

  Widget _buildEmailField(double scaleFactor) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: emailFieldController,
        style: TextStyle(
          color: const Color(0X7F000000),
          fontSize: 18 * scaleFactor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email, color: Color(0XFF034985)),
          hintText: "Email",
          hintStyle: TextStyle(
            color: const Color(0X7F000000),
            fontSize: 18 * scaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          filled: true,
          fillColor: const Color(0XFFFFFFFF),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 18 * scaleFactor, vertical: 18 * scaleFactor),
        ),
      ),
    );
  }

  Widget _buildPasswordField(double scaleFactor) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: passwordFieldController,
        obscureText: true,
        style: TextStyle(
          color: const Color(0X7F000000),
          fontSize: 18 * scaleFactor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Color(0XFF034985)),
          hintText: "Password",
          hintStyle: TextStyle(
            color: const Color(0X7F000000),
            fontSize: 18 * scaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          filled: true,
          fillColor: const Color(0XFFFFFFFF),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 18 * scaleFactor, vertical: 18 * scaleFactor),
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField(double scaleFactor) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: confirmPasswordFieldController,
        obscureText: true,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          color: const Color(0X7F000000),
          fontSize: 18 * scaleFactor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Color(0XFF034985)),
          hintText: "Confirm Password",
          hintStyle: TextStyle(
            color: const Color(0X7F000000),
            fontSize: 18 * scaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.46,
            ),
          ),
          filled: true,
          fillColor: const Color(0XFFFFFFFF),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 18 * scaleFactor, vertical: 18 * scaleFactor),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(double scaleFactor) {
    return Container(
      width: double.infinity,
      height: 64 * scaleFactor,
      margin: EdgeInsets.only(right: 8 * scaleFactor),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.person_add, color: Colors.white), // Sign-up icon
        label: Text(
          "Sign Up",
          style: TextStyle(
            color: const Color(0XFFFFFFFF),
            fontSize: 18 * scaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0XFF034985),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30 * scaleFactor, vertical: 10 * scaleFactor),
        ),
        onPressed: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define a consistent scaling factor
    final scaleFactor = (screenWidth / 375 + screenHeight / 812) / 2;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF034985),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(scaleFactor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40 * scaleFactor),
              _buildSignInColumn(scaleFactor),
              SizedBox(height: 70 * scaleFactor),
              _buildFormContainer(scaleFactor),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(double scaleFactor) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80 * scaleFactor,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 60 * scaleFactor,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 20 * scaleFactor,
          top: 20 * scaleFactor,
          bottom: 20 * scaleFactor,
        ),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24 * scaleFactor,
        ),
      ),
      title: SizedBox.shrink(),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            top: 10 * scaleFactor,
            right: 20 * scaleFactor,
            bottom: 10 * scaleFactor,
          ),
          child: Text(
            "Register",
            style: TextStyle(
              color: const Color(0XFFFFFFFF),
              fontSize: 22 * scaleFactor,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInColumn(double scaleFactor) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30 * scaleFactor,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Sign In",
          style: TextStyle(
            color: const Color(0XFFFFFFFF),
            fontSize: 36 * scaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildFormContainer(double scaleFactor) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 30 * scaleFactor,
        vertical: 50 * scaleFactor,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(20 * scaleFactor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20 * scaleFactor),
          _buildTextField(
            controller: userNameController,
            hintText: "Username",
            icon: Icons.person,
            scaleFactor: scaleFactor,
          ),
          SizedBox(height: 20 * scaleFactor),
          _buildTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
            icon: Icons.lock,
            scaleFactor: scaleFactor,
          ),
          SizedBox(height: 20 * scaleFactor),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                color: const Color(0XCC000000),
                fontSize: 18 * scaleFactor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20 * scaleFactor),
          _buildSignInButton(scaleFactor),
          SizedBox(height: 30 * scaleFactor),
          _buildSocialSignInRow(
            icon: "images/google.jpg",
            buttonText: "Continue with Google",
            scaleFactor: scaleFactor,
          ),
          SizedBox(height: 20 * scaleFactor),
          _buildSocialSignInRow(
            icon: "images/facebook.jpg",
            buttonText: "Continue with Facebook",
            scaleFactor: scaleFactor,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    required IconData icon,
    required double scaleFactor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * scaleFactor),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          color: const Color(0X7F000000),
          fontSize: 18 * scaleFactor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0X7F000000),
            fontSize: 18 * scaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            icon,
            color: const Color(0XFF034985),
            size: 24 * scaleFactor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
            borderSide: const BorderSide(
              color: Color(0X8EA5C9ED),
              width: 0.5,
            ),
          ),
          filled: true,
          fillColor: const Color(0XFFFFFFFF),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16 * scaleFactor,
            vertical: 14 * scaleFactor,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(double scaleFactor) {
    return SizedBox(
      width: double.infinity,
      height: 50 * scaleFactor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0XFF034985),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10 * scaleFactor),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.login,
              color: Colors.white,
              size: 24 * scaleFactor,
            ),
            SizedBox(width: 10 * scaleFactor),
            Text(
              "Sign In",
              style: TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 20 * scaleFactor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialSignInRow({
    required String icon,
    required String buttonText,
    required double scaleFactor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * scaleFactor,
        vertical: 14 * scaleFactor,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(12 * scaleFactor),
        border: Border.all(
          color: const Color(0X8EA5C9ED),
          width: 0.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0X14000000),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8 * scaleFactor),
            child: SizedBox(
              height: 24 * scaleFactor,
              width: 24 * scaleFactor,
              child: Image.asset(icon),
            ),
          ),
          Expanded(
            child: Text(
              buttonText,
              style: TextStyle(
                color: const Color(0XFF000000),
                fontSize: 16 * scaleFactor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: const Color(0XFF000000),
            size: 16 * scaleFactor,
          ),
        ],
      ),
    );
  }
}

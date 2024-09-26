import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Positioned image with specific dimensions and margins
            Positioned(
              top: 100.0, // Distance from the top of the page
              left: 30.0, // Distance from the left of the page
              right: 30.0,
              child: Container(
                width: 270, // Desired width of the image
                height: 270.0, // Desired height of the image
                child: Image.asset('images/logo2.png'),
              ),
            ),

            // Bottom centered container with increased height and curved corners
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 280.0, // Increased height of the blue container
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF034985),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)), // Curved corners at the top
                  ),
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0), // Rounded corners for the buttons
                            ),
                            width: 200,
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF034985),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0), // Rounded corners for the buttons
                            ),
                            width: 200,
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF034985),
                                fontSize:23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

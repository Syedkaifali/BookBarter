import 'dart:ui';
import 'package:flutter/material.dart';

class LoginIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background (Gradient + Ginkgo Leaves)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE0F2F1), // Very light teal/green
                  Color(0xFF9980CB), // Slightly darker teal/green
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Adjust for subtlety
              child: Image.asset(
                'images/book.jpeg', // Replace with your image path
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat, // If it's a repeating pattern
              ),
            ),
          ),

          // 2. Main Frosted Glass Container (Centered)
          Center(
            child: Container(
              width: screenWidth * 0.85, // Adjust width
              height: screenHeight * 0.8, // Adjust height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent, // Transparent to allow layers within
              ),
              child: ClipRRect( // Clip content to the rounded corners of this container
                borderRadius: BorderRadius.circular(30.0),
                child: Stack(
                  children: [
                    // Top White Section
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: screenHeight * 0.8 * 0.55, // Approximately 55% of the container height for the top section
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/bookbarter-logo.png', // Your GROW logo
                              height: 100, // Adjust size
                            ),
                            SizedBox(height: 5),
                            Text(
                              'TAKE GOOD CARE',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Frosted Glass Section
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: screenHeight * 0.8 * 0.5, // Approximately 50% of the container height for bottom section (overlaps slightly with top)
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0), // Apply to this section
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust blur
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2), // Semi-transparent white
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3), // Subtle border
                                width: 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end, // Align content to bottom
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Make Space for',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'More Green',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                         'Exchange books locally and easily. BookBarter connects you with nearby readers.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Register button pressed!');
                                          // Navigate to registration page
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white.withOpacity(0.3), // Semi-transparent white
                                          foregroundColor: Colors.white, // Text color
                                          padding: EdgeInsets.symmetric(vertical: 15.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            side: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.0), // Light border
                                          ),
                                          elevation: 0, // No shadow
                                        ),
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Sign In button pressed!');
                                          // Navigate to login page
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white, // Solid white background
                                          foregroundColor: Color(0xFF9980CB), // Green text color
                                          padding: EdgeInsets.symmetric(vertical: 15.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          elevation: 5, // Subtle shadow
                                        ),
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                    ),

                    // Plant Image (positioned to create the cutout effect)
                    Positioned(
                      top: screenHeight * 0.8 * 0.35, // Adjust this value to precisely position the plant
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/BookObject.png', // Your plant PNG with transparent background
                          height: screenHeight * 0.55 * 0.35, // Adjust height
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
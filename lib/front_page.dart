import 'package:flutter/material.dart';
import 'questions_page.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.teal, // Peach background color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05), // Top space (5% of screen height)
            Image.asset(
              'assets/habit.png', // Replace with your image path
              height: screenHeight * 0.63, // Image height (25% of screen height)
              alignment: Alignment.topCenter,
              
            ),
            SizedBox(height: screenHeight * 0.01), // Space between image and quote
            Expanded(
              child: Center(
                child: Text(
                  "We believe in you! \nTogether, we'll figure out a way to modify your habits to suit your lifestyle. \nLet's get to know the new you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenHeight * 0.025, // Font size relative to screen height
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionsPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, // Vertical padding (2% of screen height)
                    horizontal: screenWidth * 0.1,  // Horizontal padding (10% of screen width)
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 177, 88),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Let's Do It!",
                    style: TextStyle(
                      fontSize: screenHeight * 0.03, // Font size relative to screen height
                      color: Color.fromARGB(255, 138, 9, 230),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Bottom space (2% of screen height)
          ],
        ),
      ),
    );
  }
}

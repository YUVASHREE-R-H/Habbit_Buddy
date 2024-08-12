import 'package:flutter/material.dart';

class HabitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // AppBar with Image
          Stack(
            children: [
              Container(
                height: screenHeight * 0.35, // Adjust height to fit image within app bar space
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/tracker.png'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50, // Position the back button below the status bar
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 16, // Position the title above the habits list
                left: 16,
                right: 16,
                child: Text(
                  'Select Habits',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          
          // Habits List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'The Habits our most determined users start with:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        _habitOption(context, 'Read', Icons.book),
                        _habitOption(context, 'Plan the day', Icons.calendar_today),
                        _habitOption(context, 'Meditate', Icons.self_improvement),
                        _habitOption(context, 'Do light exercise', Icons.fitness_center),
                        _habitOption(context, 'Drink water', Icons.local_drink),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _habitOption(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tracker', arguments: title);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        color: Color.fromARGB(255, 253, 187, 74),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(fontSize: 20, color: Color.fromARGB(217, 135, 3, 3)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

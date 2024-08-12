import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int currentQuestionIndex = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'How would you describe your physical health?',
      'options': [
        {'text': 'Excellent', 'icon': Icons.favorite},
        {'text': 'Good', 'icon': Icons.thumb_up},
        {'text': 'Fair', 'icon': Icons.thumbs_up_down},
        {'text': 'Poor', 'icon': Icons.thumb_down},
      ],
    },
    {
      'question': 'What would you like to improve at the moment?',
      'options': [
        {'text': 'Physical health', 'icon': Icons.fitness_center},
        {'text': 'Mental health', 'icon': Icons.psychology},
        {'text': 'Productivity', 'icon': Icons.access_time},
        {'text': 'Diet', 'icon': Icons.restaurant},
      ],
    },
    {
      'question': 'How can you describe your lifestyle?',
      'options': [
        {'text': 'Active', 'icon': Icons.directions_run},
        {'text': 'Sedentary', 'icon': Icons.weekend},
        {'text': 'Balanced', 'icon': Icons.balance},
        {'text': 'Hectic', 'icon': Icons.alarm},
      ],
    },
    {
      'question': 'How much time are you ready to devote to working on your habits?',
      'options': [
        {'text': 'Less than 30 mins', 'icon': Icons.timer_10},
        {'text': '30-60 mins', 'icon': Icons.timer},
        {'text': '1-2 hours', 'icon': Icons.timer},
        {'text': 'More than 2 hours', 'icon': Icons.hourglass_full},
      ],
    },
    {
      'question': 'What time of day do you prefer to work on your habits?',
      'options': [
        {'text': 'Morning', 'icon': Icons.wb_sunny},
        {'text': 'Afternoon', 'icon': Icons.brightness_high},
        {'text': 'Evening', 'icon': Icons.nights_stay},
        {'text': 'Night', 'icon': Icons.bedtime},
      ],
    },
  ];

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Navigate to a new screen with the quote
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StayHealthyPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.teal, // Oceanic green background color
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.40, // Height for the top part including AppBar
            child: Stack(
              children: [
                AppBar(
                  title: SizedBox.shrink(), // No title, so it's just an image space
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 50, // Position the image just below the status bar
                  child: Image.asset(
                    'assets/ques.png', // Replace with your image path
                    height: screenHeight * 0.45,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    questions[currentQuestionIndex]['question'],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ...questions[currentQuestionIndex]['options'].map<Widget>((option) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton.icon(
                        onPressed: _nextQuestion,
                        icon: Icon(option['icon'], size: 28),
                        label: Text(option['text'], style: TextStyle(fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 131, 194, 180),
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StayHealthyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.60, // Image takes a portion of the screen
            child: Image.asset(
              'assets/healthy.png', // Replace with your image path
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Stay Healthy, \n Stay Happy!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/habits'); // Navigate to the habit page
            },
            child: Text("Continue to Habits", style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 131, 194, 180),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

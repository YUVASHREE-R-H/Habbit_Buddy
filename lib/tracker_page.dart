import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  List<Map<String, dynamic>> habits = [];
  int? selectedIndex;
  DateTime _currentDate = DateTime.now();

  final List<Map<String, dynamic>> availableHabits = [
    {'name': 'Read', 'icon': Icons.book, 'quote': 'Reading is to the mind what exercise is to the body.'},
    {'name': 'Plan the Day', 'icon': Icons.calendar_today, 'quote': 'A good plan today is better than a perfect plan tomorrow.'},
    {'name': 'Meditate', 'icon': Icons.self_improvement, 'quote': 'Meditation is the key to clarity.'},
    {'name': 'Do Light Exercise', 'icon': Icons.fitness_center, 'quote': 'Exercise not only changes your body, it changes your mind, your attitude, and your mood.'},
    {'name': 'Drink Water', 'icon': Icons.local_drink, 'quote': 'Water is the driving force of all nature.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA), // Light blue background color
      appBar: AppBar(
        title: Text('Habit Tracker'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 31, // Assume a month has 31 days
              itemBuilder: (context, index) {
                DateTime day = DateTime(_currentDate.year, _currentDate.month, index + 1);
                bool isCompleted = _isDayCompleted(day);
                return Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Icon(
                        isCompleted
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: Colors.green,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          habits.isEmpty
              ? Text(
                  'No habits added yet. Start tracking your habits!',
                  style: TextStyle(fontSize: 18),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(habits[index]['icon'], size: 40),
                            title: Text(
                              habits[index]['name'],
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(habits[index]['quote']),
                            trailing: Checkbox(
                              value: habits[index]['checked'] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  habits[index]['checked'] = value ?? false;
                                  _updateCompletionStatus();
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          selectedIndex != null
              ? Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.lightGreenAccent,
                  child: Column(
                    children: [
                      Icon(
                        habits[selectedIndex!]['icon'],
                        size: 80,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 20),
                      Text(
                        habits[selectedIndex!]['name'],
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        habits[selectedIndex!]['quote'],
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              _showHabitSelectionDialog();
            },
            icon: Icon(Icons.add),
            label: Text('Add New Habit'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showHabitSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select a Habit'),
          content: Container(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: availableHabits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(availableHabits[index]['icon']),
                  title: Text(availableHabits[index]['name']),
                  onTap: () {
                    setState(() {
                      habits.add({
                        'name': availableHabits[index]['name'],
                        'icon': availableHabits[index]['icon'],
                        'quote': availableHabits[index]['quote'],
                        'checked': false, // Initialize checkbox state
                        'completedDates': [],
                      });
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  bool _isDayCompleted(DateTime day) {
    // Check if all habits are completed for the given day
    return habits.isNotEmpty &&
        habits.every((habit) => habit['completedDates'].contains(day.day));
  }

  void _updateCompletionStatus() {
    DateTime today = DateTime.now();

    setState(() {
      if (habits.every((habit) => habit['checked'] == true)) {
        for (var habit in habits) {
          if (!habit['completedDates'].contains(today.day)) {
            habit['completedDates'].add(today.day);
          }
        }
      } else {
        for (var habit in habits) {
          habit['completedDates'].remove(today.day);
        }
      }
    });
  }
}

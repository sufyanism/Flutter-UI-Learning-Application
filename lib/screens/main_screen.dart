import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'learning_screen.dart';
import 'meaning_screen.dart';
import 'daily_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  bool showHome = true;

  final screens = const [
    LearningScreen(),
    MeaningScreen(),
    DailyScreen(),     // NEW TAB
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showHome
          ? HomeScreen(
        onContinue: () => setState(() => showHome = false),
      )
          : screens[_index],

      bottomNavigationBar: showHome
          ? null
          : BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        selectedItemColor: Colors.deepOrange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Learning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: "Meaning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: "Daily",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/learning_item.dart';
import '../utils/json_loader.dart';
import 'learning_detail_screen.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  List<LearningItem> items = [];
  bool isLoading = true;

  final List<List<Color>> cardColors = [
    [Colors.deepPurple, Colors.purple],
    [Colors.blue, Colors.lightBlue],
    [Colors.orange, Colors.deepOrange],
    [Colors.teal, Colors.green],
    [Colors.red, Colors.redAccent],
    [Colors.pink, Colors.pinkAccent],
    [Colors.indigo, Colors.blueAccent],
    [Colors.cyan, Colors.tealAccent],
    [Colors.brown, Colors.orangeAccent],
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    items = await JsonLoader.loadLearning();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            final colors = cardColors[index % cardColors.length];
            final icon = _getIcon(item.icon);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 450),
                    pageBuilder: (_, animation, __) => FadeTransition(
                      opacity: animation,
                      child: LearningDetailScreen(
                        item: item,
                        colors: colors,
                        icon: icon,
                      ),
                    ),
                  ),
                );
              },

              child: Hero(
                tag: item.title,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 50, color: Colors.white),
                        const SizedBox(height: 14),

                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'school':
        return Icons.school;
      case 'menu_book':
        return Icons.menu_book;
      case 'info':
        return Icons.info;
      case 'category':
        return Icons.category;
      case 'pin':
        return Icons.push_pin;
      case 'groups':
        return Icons.groups;
      case 'view_module':
        return Icons.view_module;
      case 'psychology':
        return Icons.psychology;
      case 'restart_alt':
        return Icons.restart_alt;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'stars':
        return Icons.stars;
      case 'gavel':
        return Icons.gavel;
      case 'history':
        return Icons.history;
      case 'self_improvement':
        return Icons.self_improvement;
      default:
        return Icons.help_outline;
    }
  }
}

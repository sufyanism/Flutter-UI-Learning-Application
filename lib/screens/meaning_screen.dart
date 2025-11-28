import 'package:flutter/material.dart';
import '../models/meaning_item.dart';
import '../utils/json_loader.dart';
import 'meaning_detail_screen.dart';

class MeaningScreen extends StatefulWidget {
  const MeaningScreen({super.key});

  @override
  State<MeaningScreen> createState() => _MeaningScreenState();
}

class _MeaningScreenState extends State<MeaningScreen> {
  List<MeaningItem> items = [];
  bool isLoading = true;

  final List<List<Color>> cardColors = [
    [Colors.orange, Colors.deepOrange],
    [Colors.teal, Colors.green],
    [Colors.indigo, Colors.blue],
    [Colors.red, Colors.redAccent],
    [Colors.purple, Colors.deepPurple],
    [Colors.cyan, Colors.tealAccent],
    [Colors.brown, Colors.orangeAccent],
  ];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    items = await JsonLoader.loadMeaning();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meaning"),
        backgroundColor: Colors.orange,
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
                    pageBuilder: (_, anim, __) => FadeTransition(
                      opacity: anim,
                      child: MeaningDetailScreen(
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
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 45, color: Colors.white),
                        const SizedBox(height: 12),

                        /// TITLE ONLY — meaning removed
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 20,
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

  IconData _getIcon(String name) {
    switch (name) {
      case "flare":
        return Icons.flare;
      case "auto_fix_high":
        return Icons.auto_fix_high;
      case "help":
        return Icons.help;
      default:
        return Icons.book;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/theme_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final VoidCallback? onContinue;
  const HomeScreen({super.key, this.onContinue});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarot Learning App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => themeNotifier.toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Tarot Learning App!',
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: widget.onContinue,
              child: const Text('Start Learning'),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            mini: true,
            child: const Icon(Icons.text_fields),
            onPressed: () {
              setState(() {
                fontSize = fontSize == 18 ? 24 : 18;
              });
            },
          ),
        ),
      ),
    );
  }
}


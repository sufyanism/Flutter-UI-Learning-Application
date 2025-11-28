import 'package:flutter/material.dart';
import '../models/daily_item.dart';

class DailyDetailScreen extends StatelessWidget {
  final DailyItem item;

  const DailyDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          item.text,
          style: const TextStyle(fontSize: 18, height: 1.5),
        ),
      ),
    );
  }
}

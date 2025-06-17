import 'package:flutter/material.dart';
import '../models/review.dart';

class GameDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final List<Review> reviews;

  const GameDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.reviews = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(imageUrl, height: 200)),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const Text('Reseñas de usuarios', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...reviews.map((reviews) => ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(reviews.username),
                  subtitle: Text(reviews.comment),
                )),
          ],
        ),
      ),
    );
  }
}

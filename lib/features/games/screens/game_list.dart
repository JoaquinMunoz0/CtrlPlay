import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import 'game_detail.dart';

class GameListScreen extends StatelessWidget {
  const GameListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todos los juegos',
          style: textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: allGames.length,
        itemBuilder: (context, index) {
          final game = allGames[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(game.imageUrl, width: 60),
              title: Text(
                game.title,
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                game.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameDetailScreen(
                      title: game.title,
                      imageUrl: game.imageUrl,
                      description: game.description,
                      reviews: game.reviews,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
